import 'package:flutter/material.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes_names.dart';
import 'package:mvvm_architecture_provider/view_model_directory/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference=Provider.of<UserViewModel>(context);
    return Scaffold(
      // appBar: AppBar(
      //  // backgroundColor: Colors.black,
      //   title: Text('Home Screen', style: TextStyle(color: Colors.white),),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
                onTap: (){
                  userPreference.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);

                  });
                     },
                child: Text('LogOut')),
          ],
        ),
      ),
    );
  }
}
