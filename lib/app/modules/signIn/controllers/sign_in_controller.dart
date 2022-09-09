import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxString email = RxString('');
  RxString password = RxString('');
  RxnString emailErrorText = RxnString(null);
  RxnString passwordErrorText = RxnString(null);
  final _okToSubmit = false.obs;
  bool emailOk = false;
  bool passOk = false;

  RxBool get okToSubmit {
    if (emailOk && passOk) {
      _okToSubmit.value = true;
    } else {
      _okToSubmit.value = false;
    }
    return _okToSubmit;
  }

  void emailChanged(String val) {
    email.value = val;

    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (email.value.isEmpty) {
      emailOk = false;
      emailErrorText.value = "Kolom harus diisi";
    } else {
      if (/*!regex.hasMatch(email.value)*/ !GetUtils.isEmail(email.value) ) {
        emailOk = false;
        emailErrorText.value = "Alamat email tidak valid";
      } else {
        emailOk = true;
        emailErrorText.value = null;
      }
    }
  }

  void passwordChanged(String val) {
    password.value = val;

    if (password.value.isEmpty) {
      passOk = false;
      passwordErrorText.value = "Kolom harus diisi";
    } else {
      passOk = true;
      passwordErrorText.value = null;
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
