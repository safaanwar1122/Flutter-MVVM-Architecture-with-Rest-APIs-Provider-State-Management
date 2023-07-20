import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture_provider/repository_directory/auth_repository.dart';
import 'package:mvvm_architecture_provider/utils_directory/routes_directory/routes_names.dart';
import 'package:mvvm_architecture_provider/utils_directory/utils.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading= false;
  bool get loading=>_loading;
  setLoading(bool value){
   _loading=value;
   notifyListeners();
  }
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
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
}
