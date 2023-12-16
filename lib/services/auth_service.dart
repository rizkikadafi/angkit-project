// import 'package:http/http.dart' as http;

// class AuthService {
//   String username;
//   String password;

//   AuthService({required this.username, this.password});

//   factory AuthService.createAuthService(Map<String, dynamic> object)

//   {
//     return AuthService(username: object['username'], password: object['password']);
//   }

//   static Future<AuthService> connectToAPI(String username, String password)

//   async {
//     String apiURL = "http://angkit.kaisan.com/checkUser";

//     var apiResult = await http.post(apiURL, body: {"username": username, "password": password});
//   }
  
// }