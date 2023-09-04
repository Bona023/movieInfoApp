class GenreListModel {
  final String genre;
  GenreListModel.fromJson(Map<String, dynamic> json) : genre = json['name'];
}
