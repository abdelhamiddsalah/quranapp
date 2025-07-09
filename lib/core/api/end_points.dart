class EndPoints {
  static const String baserUrl = "http://10.0.2.2:8080/";
  static const String signup = "auth/signup"; 
  static const String login = "auth/login"; 
  static const String surahEndpoint = 'surahs';

  static String search(String keyword) => "api/search?keyword=$keyword";
  static const String profile = "profile";

  static String surahDetails(String surahId) => "surahs/$surahId/ayata";


  static String addFavorite(int surahId, int ayaNumber) =>
      "api/favourites/$surahId/$ayaNumber";

  static String isFavorite(int surahId, int ayaNumber) =>
      "api/favourites/is-favourite/$surahId/$ayaNumber";


 
  static String getFavorites= "api/favourites";

}
