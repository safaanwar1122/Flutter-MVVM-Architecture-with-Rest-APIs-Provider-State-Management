import 'dart:js';

class MovieListModel {
  List<Movies>? movies;
  MovieListModel({this.movies});
  MovieListModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(new Movies.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['movies'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  dynamic? contentRating;
  String? duration;
  String? releaseDate;
  dynamic? averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
 dynamic? imdbRating;
  String? posterurl;
  Movies(
      {this.id,
      this.title,
      this.year,
      this.actors,
      this.averageRating,
      this.contentRating,
      this.duration,
      this.genres,
      this.imdbRating,
      this.originalTitle,
      this.poster,
      this.posterurl,
      this.ratings,
      this.releaseDate,
      this.storyline});
  Movies.fromJson(Map<String, dynamic> json) {

   id=json['id'];
  title=json['title'];
   year=json['year'];
  actors=json['actors'].cast<String>();
    averageRating=json['averageRating'];
    contentRating=json['contentRating'];
    duration=json['duration'];
   genres=json['genres'].cast<String>();
   imdbRating=json['imdbRating'];
  originalTitle=json['originalTitle'];
  poster=json['poster'];
   posterurl=json['posterurl'];
  ratings=json['ratings'].cast<String>();
   releaseDate=json['releaseDate'];
  storyline=json['storyline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id']=  this.id;
    data['title']=  this.title;
    data['year']=   this.year;
    data['actors']=  this.actors;
    data['averageRating']=  this.averageRating;
    data['contentRating']=   this.contentRating;
    data['duration']=   this.duration;
    data['genres']=   this.genres;
    data['imdbRating']=   this.imdbRating;
    data['originalTitle']=   this.originalTitle;
    data['poster']=   this.poster;
    data['posterurl']=    this.posterurl;
    data['ratings']=    this.ratings;
    data['releaseDate']=    this.releaseDate;
    data['storyline']=   this.storyline;
    return data;
  }
}
