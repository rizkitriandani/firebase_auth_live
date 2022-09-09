import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../global_widgets/widgets.dart';
import '../../../utils/logger.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignInView'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Obx(() => authController.isLoading.value
            ? const LoadingScreen()
            : Column(
                children: [
                  InputField(
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'Masukan Email Anda',
                    onChanged: controller.emailChanged,
                    textEditingController: controller.emailController,
                    errorMsg: controller.emailErrorText.value,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputField(
                    obscureText: true,
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'Masukan Kata Sandi Anda',
                    onChanged: controller.passwordChanged,
                    textEditingController: controller.passwordController,
                    errorMsg: controller.passwordErrorText.value,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SimpleButton(
                    label: 'Sign In',
                    onPressed: () => authController.signIn(
                        controller.emailController.text,
                        controller.passwordController.text),
                  )
                ],
              )),
      ),
    );
  }
}
