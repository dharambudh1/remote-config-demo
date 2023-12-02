import "dart:convert";
import "dart:developer";

import "package:firebase_core/firebase_core.dart";
import "package:firebase_remote_config/firebase_remote_config.dart";

class RemoteConfigService {
  RemoteConfigService._();
  static final RemoteConfigService instance = RemoteConfigService._();

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  final String paramBoolean = "param_boolean";
  final String paramJson = "param_json";
  final String paramNumber = "param_number";
  final String paramString = "param_string";
  final String paramColor = "param_color";

  Future<void> initFirebaseRemoteConfig() async {
    const Duration duration = Duration.zero;
    final RemoteConfigSettings remoteConfigSettings = RemoteConfigSettings(
      fetchTimeout: duration,
      minimumFetchInterval: duration,
    );
    await remoteConfig.setConfigSettings(remoteConfigSettings);
    await fetchAndActivate();
    return Future<void>.value();
  }

  Future<bool> fetchAndActivate() async {
    bool activate = false;
    try {
      activate = await remoteConfig.fetchAndActivate();
      log("RemoteConfigService: fetchAndActivate(): value: $activate");
    } on FirebaseException catch (error) {
      log("RemoteConfigService: fetchAndActivate(): error: $error");
    } finally {}
    return Future<bool>.value(activate);
  }

  Future<bool> getBool() async {
    final bool value = remoteConfig.getBool(paramBoolean);
    return Future<bool>.value(value);
  }

  Future<Map<String, dynamic>> getJson() async {
    final String value = remoteConfig.getString(paramJson);
    return Future<Map<String, dynamic>>.value(jsonDecode(value));
  }

  Future<double> getDouble() async {
    final double value = remoteConfig.getDouble(paramNumber);
    return Future<double>.value(value);
  }

  Future<String> getString() async {
    final String value = remoteConfig.getString(paramString);
    return Future<String>.value(value);
  }

  Future<String> getColor() async {
    final String value = remoteConfig.getString(paramColor);
    return Future<String>.value(value);
  }
}
