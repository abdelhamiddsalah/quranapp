class EndPoints {
  static const String baserUrl = "http://10.0.2.2:8080/";
  static const String signup = "auth/signup"; 
  static const String login = "auth/login"; 
   static const String surahEndpoint = 'surahs';
  static String search(String keyword) => "api/search?keyword=$keyword";
  static String profile ="profile";
  static String surahDetails(String surahId) => "surahs/$surahId/ayata";
  static String addFavorite(int id) => "api/favourites/$id";
  static String getFavorites= "api/favourites";
}
