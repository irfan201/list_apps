import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_apps/app/modules/listUser/controllers/list_user_controller.dart';

class ListUserView extends GetView<ListUserController> {
  const ListUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListUserView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                  !controller.isLoading.value) {
                controller.loadMoreUsers();
                return true;
              }
              return false;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: controller.users.length + 1, 
                itemBuilder: (context, index) {
                  if (index < controller.users.length) {
                    var user = controller.users[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                        title: Text('${user.firstName} ${user.lastName}', style: const TextStyle(fontSize: 20),),
                        subtitle: Text(user.email, style: const TextStyle(fontSize: 16),),
                      ),
                    );
                  } else {
                    return controller.isLoading.value
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : const SizedBox.shrink();
                  }
                },
              ),
            ),
          );
        }
      }),
    );
  }
}
