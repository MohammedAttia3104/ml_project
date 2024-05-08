class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '72444b813eb7bb707dca4f44e9c85b45';
  static const nowPlayingMoviesPath =
      '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const popularMoviesPath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const topRatedMoviesPath = '$baseUrl/movie/top_rated?api_key=$apiKey';

  static String movieDetailsPath(int movieId) =>
      '$baseUrl/movie/$movieId?api_key=$apiKey';

  static String movieRecommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const onAirTvsPath = '$baseUrl/tv/on_the_air?api_key=$apiKey';
  static const popularTvsPath = '$baseUrl/tv/popular?api_key=$apiKey';
  static const topRatedTvsPath = '$baseUrl/tv/top_rated?api_key=$apiKey';

  static String tvDetailsPath(int tvId) => "$baseUrl/tv/$tvId?api_key=$apiKey";

  static String tvRecommendationPath(int tvId) =>
      "$baseUrl/tv/$tvId/recommendations?api_key=$apiKey";

  static String multiSearchPath(String searchParamter) {
    return "$baseUrl/search/multi?query=$searchParamter&api_key=$apiKey";
  }

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static const String basePosterUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static String posterUrl(String path) => '$basePosterUrl$path';
}
