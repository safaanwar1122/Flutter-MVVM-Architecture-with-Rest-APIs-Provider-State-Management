import 'package:flutter/material.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes_names.dart';
import 'package:mvvm_architecture_provider/view_model_directory/auth_view_model.dart';
import 'package:mvvm_architecture_provider/view_model_directory/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         primarySwatch: Colors.lightBlue,
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
