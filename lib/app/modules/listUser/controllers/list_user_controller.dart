import 'package:get/get.dart';
import 'package:list_apps/api/api.dart';
import 'package:list_apps/model/user_model.dart';

class ListUserController extends GetxController {
  var users = <UserModel>[].obs;
  var isLoading = false.obs;
  var currentPage = 1;
  var totalPages = 2; 

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    if (currentPage <= totalPages) {
      try {
        isLoading(true);
        var fetchedUsers = await ApiService().fetchUsers(page: currentPage);
        users.addAll(fetchedUsers); 
        currentPage++;
      } catch (e) {
        Get.snackbar('Error', 'Failed to load users');
      } finally {
        isLoading(false);
      }
    }
  }

  void loadMoreUsers() {
    if (!isLoading.value && currentPage <= totalPages) {
      fetchUsers();
    }
  }
}
