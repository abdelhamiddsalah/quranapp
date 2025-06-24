class EndPoints {
  static const String baserUrl = "http://10.0.2.2:8080/";
 
  static const String signup = "auth/signup"; 
  static const String login = "auth/login"; 
   static const String surahEndpoint = 'surahs';
  static String search(String keyword) => "api/search?keyword=$keyword";
  static String profile(int id) => "profile/$id";
}
