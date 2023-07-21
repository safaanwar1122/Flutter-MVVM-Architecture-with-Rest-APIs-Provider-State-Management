

import '../data_directory/network_directory/BaseApiServices.dart';
import '../data_directory/network_directory/NetworkApiService.dart';
import '../model_directory/movies_model.dart';
import '../resources_directory/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint );
      return response=MovieListModel.fromJson(response);
    } catch (e) {
      throw (e);
    }
  }


}
