import "package:get/get.dart";

class HomeController extends GetxController {
  final RxBool _homeBoolValue = false.obs;
  final RxMap<String, dynamic> _homeJsonValue = <String, dynamic>{}.obs;
  final RxDouble _homeDoubleValue = 0.0.obs;
  final RxString _homeStringValue = "-".obs;
  final RxString _homeColorValue = "".obs;

  bool get homeBoolValue => _homeBoolValue.value;
  set homeBoolValue(bool value) => _homeBoolValue(value);

  // ignore: invalid_use_of_protected_member
  Map<String, dynamic> get homeJsonValue => _homeJsonValue.value;
  set homeJsonValue(Map<String, dynamic> value) => _homeJsonValue(value);

  double get homeDoubleValue => _homeDoubleValue.value;
  set homeDoubleValue(double value) => _homeDoubleValue(value);

  String get homeStringValue => _homeStringValue.value;
  set homeStringValue(String value) => _homeStringValue(value);

  String get homeColorValue => _homeColorValue.value;
  set homeColorValue(String value) => _homeColorValue(value);
}
