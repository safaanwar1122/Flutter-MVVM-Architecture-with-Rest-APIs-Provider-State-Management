import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture_provider/model_directory/user_model.dart';
import 'package:mvvm_architecture_provider/repository_directory/auth_repository.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes_names.dart';
import 'package:mvvm_architecture_provider/utils_directory/utils.dart';
import 'package:mvvm_architecture_provider/view_model_directory/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading= false;
  bool get loading=>_loading;

  bool _signUpLoading=false;
  bool get signUpLoading=>_signUpLoading;


  setLoading(bool value){
   _loading=value;
   notifyListeners();
  }
  setSignUpLoading(bool value){
    _signUpLoading=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {

      setLoading(false);
      final userPreference=Provider.of<UserViewModel>(context,listen:false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      Utils.flushBarErrorMessage('Login successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }


  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('SignUp successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);

      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

}
