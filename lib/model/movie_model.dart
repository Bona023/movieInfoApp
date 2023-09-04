class MovieModel {
  final String title, poster;
  final num id;
  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        poster = "https://image.tmdb.org/t/p/w500" + json['poster_path'],
        id = json['id'];
}
