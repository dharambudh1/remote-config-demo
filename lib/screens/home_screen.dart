import "dart:async";
import "dart:convert";

import "package:after_layout/after_layout.dart";
import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:remote_config_demo/controllers/home_controller.dart";
import "package:remote_config_demo/services/remote_config_service.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterLayoutMixin<HomeScreen> {
  final HomeController _controller = Get.find();

  final RemoteConfigService _instance = RemoteConfigService.instance;
  late StreamSubscription<RemoteConfigUpdate>? _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription = _instance.remoteConfig.onConfigUpdated.listen(
      (RemoteConfigUpdate event) async {
        await _instance.remoteConfig.activate();
        if (event.updatedKeys.contains(_instance.paramBoolean)) {
          await onPressedGetBool();
        } else {}
        if (event.updatedKeys.contains(_instance.paramJson)) {
          await onPressedGetJson();
        } else {}
        if (event.updatedKeys.contains(_instance.paramNumber)) {
          await onPressedGetDouble();
        } else {}
        if (event.updatedKeys.contains(_instance.paramString)) {
          await onPressedGetString();
        } else {}
        if (event.updatedKeys.contains(_instance.paramColor)) {
          await onPressedGetColor();
        } else {}
      },
    );
  }

  @override
  void dispose() {
    unawaited(_streamSubscription?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(scaffoldWidget);
  }

  Widget scaffoldWidget() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remote Config Demo"),
      ),
      backgroundColor: fromHex(_controller.homeColorValue),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                dense: true,
                title: Text(_controller.homeBoolValue.toString()),
                subtitle: const Text("Tap on download to fetch a new data"),
                leading: const Icon(Icons.check_circle),
                onTap: onPressedGetBool,
                trailing: const Icon(Icons.download),
              ),
              ListTile(
                dense: true,
                title: Text(prettyprintFunction(_controller.homeJsonValue)),
                subtitle: const Text("Tap on download to fetch a new data"),
                leading: const Icon(Icons.data_object),
                onTap: onPressedGetJson,
                trailing: const Icon(Icons.download),
              ),
              ListTile(
                dense: true,
                title: Text(_controller.homeDoubleValue.toString()),
                subtitle: const Text("Tap on download to fetch a new data"),
                leading: const Icon(Icons.numbers),
                onTap: onPressedGetDouble,
                trailing: const Icon(Icons.download),
              ),
              ListTile(
                dense: true,
                title: Text(_controller.homeStringValue),
                subtitle: const Text("Tap on download to fetch a new data"),
                leading: const Icon(Icons.abc),
                onTap: onPressedGetString,
                trailing: const Icon(Icons.download),
              ),
              ListTile(
                dense: true,
                title: Text(_controller.homeColorValue),
                subtitle: const Text("Tap on download to fetch a new data"),
                leading: const Icon(Icons.colorize),
                onTap: onPressedGetColor,
                trailing: const Icon(Icons.download),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onPressedGetBool() async {
    final bool value = await _instance.getBool();
    _controller.homeBoolValue = value;
    return Future<void>.value();
  }

  Future<void> onPressedGetJson() async {
    final Map<String, dynamic> value = await _instance.getJson();
    _controller.homeJsonValue = value;
    return Future<void>.value();
  }

  Future<void> onPressedGetDouble() async {
    final double value = await _instance.getDouble();
    _controller.homeDoubleValue = value;
    return Future<void>.value();
  }

  Future<void> onPressedGetString() async {
    final String value = await _instance.getString();
    _controller.homeStringValue = value;
    return Future<void>.value();
  }

  Future<void> onPressedGetColor() async {
    final String value = await _instance.getColor();
    _controller.homeColorValue = value;
    return Future<void>.value();
  }

  String prettyprintFunction(Map<String, dynamic> json) {
    const JsonEncoder encoder = JsonEncoder.withIndent("  ");
    final String prettyprint = encoder.convert(json);
    return prettyprint;
  }

  Color fromHex(String hexString) {
    Color color = Colors.transparent;
    if (hexString.isEmpty) {
      color = Theme.of(context).scaffoldBackgroundColor;
    } else {
      final StringBuffer buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) {
        buffer.write("ff");
      } else {}
      buffer.write(hexString.replaceFirst("#", ""));
      color = Color(int.parse(buffer.toString(), radix: 16));
    }
    return color;
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await _instance.initFirebaseRemoteConfig();
    return Future<void>.value();
  }
}
