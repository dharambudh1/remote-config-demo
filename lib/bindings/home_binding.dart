import "package:get/get.dart";
import "package:remote_config_demo/controllers/home_controller.dart";

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(HomeController.new);
  }
}
