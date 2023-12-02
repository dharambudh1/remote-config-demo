import "package:get/get.dart";
import "package:remote_config_demo/bindings/home_binding.dart";
import "package:remote_config_demo/screens/home_screen.dart";

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  String get homeScreen => "/";

  List<GetPage<dynamic>> get getPages {
    final GetPage<dynamic> getPage = GetPage<dynamic>(
      name: homeScreen,
      page: HomeScreen.new,
      binding: HomeBinding(),
    );
    return <GetPage<dynamic>>[getPage];
  }
}
