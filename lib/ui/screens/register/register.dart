import 'package:assignment/ui/custom_widget/text_form_field.dart';
import 'package:assignment/utils/AppRoutes/AppRoute.dart';
import 'package:assignment/utils/app_color/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../custom_widget/custom_toggle_switch.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscure = true;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appLightColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 24, color: Colors.black),
        ),
        title: Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildLogo(),
            SizedBox(height: 20),
            Form(
              key: formKey,
              child: Column(
                children: [
                  buildName(),
                  SizedBox(height: 10),
                  buildEmail(),
                  SizedBox(height: 10),
                  buildPasswordTextField(),
                  SizedBox(height: 10),
                  buildRePassword(),
                  SizedBox(height: 10),
                  buildElevatedButton(),
                  SizedBox(height: 10),
                  buildTextLogin(),

                  SizedBox(height: 20),
                  CustomeImageToggle(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildLogo() {
    return Center(child: Image.asset("assets/images/Logo.png"));
  }

  buildPasswordTextField() {
    return CustomTextFormField(
      titleText: "password",
      prefixIcon: Icon(Icons.lock),
      obscureText: obscure,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "please Enter Your password";
        }
        return null;
      },
      suffixIcon: InkWell(
        onTap: () {
          obscure = !obscure;
          setState(() {});
        },
        child: obscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
      ),
      controller: passwordController,
    );
  }

  buildEmail() {
    return CustomTextFormField(
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Please Enter Email";
        }
        return null;
      },
      titleText: "Email",
      prefixIcon: Icon(Icons.email_rounded),
      controller: emailController,
    );
  }

  buildName() {
    return CustomTextFormField(
      titleText: "Name",
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "please Enter your name";
        }
      },
      prefixIcon: Icon(Icons.person, size: 24),
      controller: nameController,
    );
  }

  buildRePassword() {
    return CustomTextFormField(
      titleText: "Re Password",
      prefixIcon: Icon(Icons.lock),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Please Enetr Re Password";
        }
        if (text != passwordController.text) {
          return "Passwords do not Match";
        }
        return null;
      },
      obscureText: obscure,
      suffixIcon: obscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
    );
  }

  buildElevatedButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          create();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          backgroundColor: Color(0xff5669FF),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          "Create Account",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void create() {
    if (formKey.currentState!.validate() == true) ;
  }

  buildTextLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already Have Account ? ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, AppRoute.googleLogin);
          },
          child: Text(
            " Login",
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Color(0xff5669FF),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
