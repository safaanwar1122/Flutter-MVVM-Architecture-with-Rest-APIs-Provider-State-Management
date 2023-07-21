


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes_names.dart';
import 'package:mvvm_architecture_provider/view_model_directory/user_view_model.dart';

import '../../model_directory/user_model.dart';

class SplashServices
{
  Future<UserModel> getUserData()=>UserViewModel().getUser();

void checkAuthentiation(BuildContext context)async
{
  getUserData().then((value) async{
    print(value.token);
    if(value.token=='null' || value.token==''){
     await  Future.delayed(Duration(seconds: 3));

      Navigator.pushNamed(context, RoutesName.login);
    }
    else {
     await  Future.delayed(Duration(seconds: 3));
      Navigator.pushNamed(context, RoutesName.home);

    }
  }).onError((error, stackTrace) {
    if(kDebugMode){
      print(error.toString());
    }
  });
}
}