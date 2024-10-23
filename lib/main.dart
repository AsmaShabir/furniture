import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:furniture/firebaseCrud.dart';
import 'package:furniture/firebase_options.dart';
import 'package:furniture/view/homeScreen.dart';
import 'package:furniture/auth/login.dart';
import 'package:furniture/auth/signUp.dart';
import 'package:furniture/view/itemsScreen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {

 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
 //Remove this method to stop OneSignal Debugging
 OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

 OneSignal.initialize("b669b1cf-2cc3-4f75-9556-44e49880689c");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

        home:LoginScreen(),
    )

      );
}




