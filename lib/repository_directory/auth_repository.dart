import 'package:mvvm_architecture_provider/data_directory/network_directory/BaseApiServices.dart';
import 'package:mvvm_architecture_provider/data_directory/network_directory/NetworkApiService.dart';
import 'package:mvvm_architecture_provider/resources_directory/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw (e);
    }
  }

}
