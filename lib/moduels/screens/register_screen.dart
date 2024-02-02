import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_e_wallet/core/consts.dart';
import 'package:insta_e_wallet/core/style.dart';
import 'package:insta_e_wallet/main.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    tabController = TabController(length: 2, vsync: this);
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              LogoWidget(
                size: 15,
              ),
              SizedBox(
                height: 20,
              ),
              Lottie.network(
                  'https://lottie.host/4d7028c3-21f2-41cd-91a5-f344aefc8ac4/870ngkPabr.json',
                  height: 200),
              TabBar(controller: tabController, tabs: [
                Text('Create Account',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
                Text('Login',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ]),
              Container(
                height: 400,
                width: double.infinity,
                child: TabBarView(controller: tabController, children: [
                  CreateAccount(
                    passwordController: passwordController,
                    phoneController: phoneController,
                    emailController: emailController,
                    nameController: nameController,
                  ),
                  Login(
                    passwordController: passwordController,
                    emailController: emailController,
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BigBtn extends StatelessWidget {
  BigBtn({super.key, required this.title, this.onTap});
  String title;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Container(
          height: 60,
          width: double.infinity,
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )),
          decoration: BoxDecoration(
              color: ColorPalette.lightBlue,
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  Login(
      {super.key,
      required this.emailController,
      required this.passwordController});
  var emailController;
  var passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextFeild(
          controller: emailController,
          validator: (val) {},
          hint: 'Email',
          type: TextInputType.name,
          prefix: Icons.email,
        ),
        MyTextFeild(
          controller: passwordController,
          validator: (val) {},
          hint: 'Password',
          type: TextInputType.name,
          prefix: Icons.password,
        ),
        BigBtn(
          title: 'Login',
          onTap: () {},
        )
      ],
    );
  }
}

class CreateAccount extends StatelessWidget {
  CreateAccount(
      {super.key,
      required this.emailController,
      required this.nameController,
      required this.passwordController,
      this.phoneController});
  var emailController;
  var passwordController;
  var nameController;
  var phoneController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextFeild(
          controller: nameController,
          validator: (val) {},
          hint: 'Name',
          type: TextInputType.name,
          prefix: Icons.abc,
        ),
        MyTextFeild(
          controller: emailController,
          validator: (val) {},
          hint: 'Email',
          type: TextInputType.name,
          prefix: Icons.email,
        ),
        MyTextFeild(
          controller: phoneController,
          validator: (val) {},
          hint: 'Phone number',
          type: TextInputType.name,
          prefix: Icons.phone,
        ),
        MyTextFeild(
          controller: passwordController,
          validator: (val) {},
          hint: 'password',
          type: TextInputType.name,
          prefix: Icons.password,
        ),
        BigBtn(
          title: 'Register',
          onTap: () {},
        )
      ],
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 55,
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
                color: ColorPalette.lightBlue,
              )),
        ),
      ),
    );
  }
}
