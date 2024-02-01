import 'package:flutter/material.dart';
import 'package:insta_e_wallet/core/style.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Lottie.network(
                'https://lottie.host/4d7028c3-21f2-41cd-91a5-f344aefc8ac4/870ngkPabr.json',
                height: 200),
            MyTextFeild(
              controller: nameController,
              validator: (val) {},
              hint: 'Name',
              type: TextInputType.name,
              prefix: Icons.abc,
            ),
            MyTextFeild(
              controller: nameController,
              validator: (val) {},
              hint: 'Email',
              type: TextInputType.name,
              prefix: Icons.abc,
            ),
            MyTextFeild(
              controller: nameController,
              validator: (val) {},
              hint: 'Phone number',
              type: TextInputType.name,
              prefix: Icons.abc,
            ),
            MyTextFeild(
              controller: nameController,
              validator: (val) {},
              hint: 'password',
              type: TextInputType.name,
              prefix: Icons.abc,
            )
          ],
        ),
      ),
    );
  }
}

class MyTextFeild extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator<String>? validator;
  TextInputType? type;
  IconData? prefix;
  bool isPassword;
  String? hint;
  String? initValu;
  MyTextFeild(
      {super.key,
      required this.controller,
      this.validator,
      this.type,
      this.hint,
      this.isPassword = false,
      this.prefix,
      this.initValu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 60,
        child: TextFormField(
          initialValue: initValu,
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          validator: validator,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              filled: true,
              focusColor: ColorPalette.lightGreen.withOpacity(0.5),
              fillColor: ColorPalette.lightGreen,
              hintText: hint,
              hintStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(16)),
              prefixIcon: Icon(
                prefix,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
