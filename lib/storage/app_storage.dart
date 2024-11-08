import 'package:get_storage/get_storage.dart';

import '../model/login_model.dart';


class AppStorage {
  static GetStorage? storage = GetStorage('User');

  static void saveIsLoggedin(dynamic value) {
    AppStorage.storage?.write("isLoggedIn", value);
  }

  static void saveUser(Map<String, dynamic> user) {
    storage?.write("user", user); // Store the map directly
  }

  static Map<String, dynamic>? get readUser {
    return storage?.read("user");
  }

  static void saveUserType(dynamic value) {
    AppStorage.storage?.write("userType", value);
  }

  static String? get readUserType {
    return storage?.read("userType");
  }

  static bool get readIsLoggedIn {
    return storage?.read("isLoggedIn") ?? false;
  }


  static bool getIsLoggedin() {
    return readIsLoggedIn;
  }

  /// Function to remove all user data
  static void removeStorage() {
    storage?.erase();
  }
}
