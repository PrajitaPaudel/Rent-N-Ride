import 'package:get_storage/get_storage.dart';

import '../model/login_model.dart';


class AppStorage {
  static GetStorage? storage = GetStorage('User');

  static void saveIsLoggedin(dynamic value) {
    storage?.write("isLoggedIn", value);
  }

  static void saveUser(Map<String, dynamic> user) {
    storage?.write("user", user);
  }

  static Map<String, dynamic>? get readUser {
    return storage?.read("user");
  }

  static void saveUserType(dynamic value) {
    storage?.write("userType", value);
  }

  static String? get readUserType {
    return storage?.read("userType");
  }
  static String? getUserType() => storage?.read("userType");


  static bool get readIsLoggedIn {
    return storage?.read("isLoggedIn") ?? false;
  }

  static void saveToken(String token) => storage?.write("token", token);
  static String? getToken() => storage?.read("token");

  static void saveUserId(String userId) {
    storage?.write("userId", userId);
    print("Saved User ID: $userId"); // Log to confirm saving
  }

  static String getUserId() {
    String userId = storage?.read("userId");
    print("Retrieved User ID: $userId"); // Log to confirm retrieval
    return userId;
  }

  static bool getIsLoggedin() {
    return readIsLoggedIn;
  }

  static void removeStorage() {
    storage?.erase();
  }
}


