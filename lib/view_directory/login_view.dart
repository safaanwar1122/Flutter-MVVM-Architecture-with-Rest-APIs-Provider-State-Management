import 'package:flutter/material.dart';
import 'package:mvvm_architecture_provider/resources_directory/components_directory/round_button.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes_names.dart';
import 'package:mvvm_architecture_provider/view_directory/home_screen.dart';
import 'package:mvvm_architecture_provider/view_model_directory/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils_directory/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final authViewMode=Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Screen '),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
                //conventional method =>   FocusScope.of(context).requestFocus(passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: 'password',
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock_open_rounded),
                        suffix: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility))),
                  );
                }),
            SizedBox(height: height * .005),
            RoundButton(
              title: 'Login',
              loading: authViewMode.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.snackBar('plz enter email', context);
                  //Utils.flushBarErrorMessage('plz enter email ', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('plz enter password ', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.toastMessage('plz enter 6 digits password ');
                  // Utils.flushBarErrorMessage(' plz enter 6 digits password ', context);
                } else {
                  // Map data={
                  //   'email':_emailController.text.toString(),
                  //   'password':_passwordController.text.toString(),
                  // };

                  Map data={
                    'email':'eve.holt@reqres.in',
                    'password':'cityslicka',
                  };

                  authViewMode.loginApi(data, context);
                  print('API hit');
                }
              },
            ),
            SizedBox(height: height * .02),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.signUp);
                },
                child: Text("Don't haved an account? Sign Up")),
          ],
        ),
      ),
    );
  }
}
