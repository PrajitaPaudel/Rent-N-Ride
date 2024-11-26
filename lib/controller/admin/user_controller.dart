import 'package:get/get.dart';

import '../../model/admin/user_model.dart';
import '../../service/admin/user_service.dart';

class UserController extends GetxController {
  final Rx<UserListModel?> userList = Rx<UserListModel?>(null);
  final RxBool isLoading = false.obs;

  final UserService userService = UserService();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    isLoading.value = true;
    final users = await userService.getAllUsers();
    userList.value = users;
    isLoading.value = false;
  }
}
