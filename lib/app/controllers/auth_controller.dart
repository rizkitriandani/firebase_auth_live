import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../routes/app_pages.dart';
import '../utils/logger.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  signUp(String email, String password) async {
    isLoading(true);
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      logger.d(credential);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        logger.d('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        logger.d('The account already exists for that email.');
      }
    } catch (e) {
      logger.d(e);
    } finally {
      isLoading(false);
    }
  }

  signIn(String email, String password) async {
    isLoading(true);
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      logger.d(credential);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.d('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        logger.d('Wrong password provided for that user.');
      }
    } finally {
      isLoading(false);
    }
  }

  signInWithGoogle() async {}

  signOut() async {
    logger.d("SIGN OUT");
    await auth.signOut();
    Get.offAllNamed(Routes.SIGN_IN);
  }
}
