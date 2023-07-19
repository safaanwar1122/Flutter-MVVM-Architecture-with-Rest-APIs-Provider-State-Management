import 'package:flutter/material.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes_names.dart';
import 'package:mvvm_architecture_provider/view_directory/home_screen.dart';

import '../utils_directory/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: InkWell(
              onTap: () {
                Utils.snackBar('error from snackbar', context);
                //Utils.flushBarErrorMessage(' internet connection error', context);
               // Utils.toastMessage('No internet connection ');
              },
              child: Text('Click ')),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
