class MovieDetailModel {
  final num id;
  final String title, overview, poster;
  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        poster = "https://image.tmdb.org/t/p/w500" + json['poster_path'];
}
