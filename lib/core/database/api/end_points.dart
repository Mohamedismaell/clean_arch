class EndPoints {
  static String baseUrl =
      'https://jsonplaceholder.typicode.com/';
  static String users = 'users';
  static String template = 'template';
  static String signUp = 'user/signup';
  static String signin = 'user/signin';

  static String checkEmail = 'user/check-email';
  static String update = 'user/update';

  static String logOut = 'user/logout';
  static String getUserDataEndPoint(String id) {
    return 'user/get-user/$id';
  }

  static String deleteUserEndpoint(String id) {
    return 'user/delete?id=$id';
  }
}

class ApiKeys {
  static String status = 'status';
  static String errorMessage = 'ErrorMessage';
  static String email = 'email';
  static String password = 'password';
  static String confirmPassword = 'confirmPassword';
  static String location = 'location';
  static String profilePic = 'profilePic';
  static String name = 'name';
  static String phone = 'phone';
  static String message = 'message';
  static String token = 'token';
  static String id = 'id';
}
