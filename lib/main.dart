import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/controllers/auth_controller.dart';
import 'app/global_widgets/widgets.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/utils/logger.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final authController = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authController.auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            logger.d(snapshot.connectionState);
            return const LoadingScreen();
          }
          logger.d(snapshot.data);

          return GetMaterialApp(
            title: "Application",
            initialRoute: snapshot.data != null ? Routes.HOME : Routes.SIGN_IN,
            getPages: AppPages.routes,
          );
        });
  }
}
