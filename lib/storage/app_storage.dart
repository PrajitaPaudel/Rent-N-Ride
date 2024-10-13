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
    return storage?.read("user");}

  static void saveUserType(dynamic value) {
    AppStorage.storage?.write("userType", value);
  }
//............................
//   static LoginModel? get readUser {
//     var userData = storage?.read("user");
//     if (userData != null) {
//       return LoginModel.fromJson(userData);
//     }
//     return null;
//   }

  static String? get readUserType {
    return storage?.read("userType");
  }

  // static User? get readUser {
  //   return storage?.read("user");
  // }

  static bool get readIsLoggedIn {
    return storage?.read("isLoggedIn") ?? false;
  }

  // ///Function to remove data
  // static void removeStorage() {
  //   AppStorage.storage?.remove("userType");
  //   AppStorage.storage?.remove("isLoggedIn");
  //   // AppStorage.storage?.remove(rememberMe);
  // }

  ///Function to remove all user data
  static void removeStorage() {
    storage?.erase();
  }
}
