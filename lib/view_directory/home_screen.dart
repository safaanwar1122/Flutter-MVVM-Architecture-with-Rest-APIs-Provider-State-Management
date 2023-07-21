import 'package:flutter/material.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes_names.dart';
import 'package:mvvm_architecture_provider/view_model_directory/user_view_model.dart';
import 'package:provider/provider.dart';

import '../data_directory/response_directory/status.dart';
import '../utils_directory/utils.dart';
import '../view_model_directory/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              onTap: () {
                userPreference.remove().then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(child: Text('LogOut'))),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, _) {
            switch (value.movieList.status) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(
                  child: Text(
                    value.movieList.message.toString(),
                  ),
                );

              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.movieList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        leading: Image.network(

                            value.movieList.data!.movies![index].posterurl
                                .toString(),
                            errorBuilder: (context, error, statck) {
                          return Icon(Icons.error, color: Colors.red);
                        },
                        height: 40,
                          width: 40,
                          fit:BoxFit.cover,
                        ),
                        title: Text(value.movieList.data!.movies![index].title
                            .toString()),
                        subtitle: Text(value.movieList.data!.movies![index].year
                            .toString()),
                        trailing: Row(
                          children: [
                            Text(Utils.averageRating(value
                                    .movieList.data!.movies![index].ratings!)
                                .toStringAsFixed(1)),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ));
                    });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
