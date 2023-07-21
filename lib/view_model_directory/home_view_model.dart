import 'package:flutter/material.dart';
import 'package:mvvm_architecture_provider/data_directory/response_directory/api_response.dart';
import 'package:mvvm_architecture_provider/model_directory/movies_model.dart';
import 'package:mvvm_architecture_provider/repository_directory/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> movieList = ApiResponse.loading();
  setMoviesList(ApiResponse<MovieListModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
