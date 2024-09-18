class Movies {
  Movies(
      {required this.title,
      required this.backDropPath,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage});

  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
        title: json ["title"],
        backDropPath: json ["backdrop_path"],
        originalTitle: json ["original_title"],
        overview: json ["overview"],
        posterPath: json ["poster_path"],
        releaseDate: json ["release_date"],
        voteAverage: json ["vote_average"],
        );
  }
}
