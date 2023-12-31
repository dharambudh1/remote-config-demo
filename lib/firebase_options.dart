// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import "package:firebase_core/firebase_core.dart" show FirebaseOptions;
import "package:flutter/foundation.dart"
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        "DefaultFirebaseOptions have not been configured for web - "
        "you can reconfigure this by running the FlutterFire CLI again.",
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for macos - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for windows - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for linux - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for fuchsia - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyD0o1AApSkXk63Yiwm9C5g-idGOTsRDsb0",
    appId: "1:602657014007:android:0d2329aebaca3fe40753f2",
    messagingSenderId: "602657014007",
    projectId: "remote-config-fb8f7",
    storageBucket: "remote-config-fb8f7.appspot.com",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyDHD_V5ZIW3i0d23KZMsOiW1BHEsNcvdlc",
    appId: "1:602657014007:ios:190f44c33d29cdcd0753f2",
    messagingSenderId: "602657014007",
    projectId: "remote-config-fb8f7",
    storageBucket: "remote-config-fb8f7.appspot.com",
    iosBundleId: "com.example.remoteConfigDemo",
  );
}
