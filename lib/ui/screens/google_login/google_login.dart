import 'package:assignment/ui/custom_widget/text_form_field.dart';
import 'package:assignment/utils/AppRoutes/AppRoute.dart';
import 'package:assignment/utils/app_color/app_colors.dart';
import 'package:flutter/material.dart';

import '../../custom_widget/custom_toggle_switch.dart';

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appLightColor,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .07),
            buildLogo(),
            SizedBox(height: 20),
            buildEmailTextFormField(),
            SizedBox(height: 10),
            buildPassword(),
            SizedBox(height: 10),
            buildForgetText(),
            SizedBox(height: 20),
            buildElevatedButton(),
            SizedBox(height: 15),
            buildTextCreate(),
            SizedBox(height: 15),
            buildDividerandOr(),
            SizedBox(height: 15),
            buildGoogleButton(),
            SizedBox(height: 20),
            CustomeImageToggle(),
          ],
        ),
      ),
    );
  }

  buildLogo() {
    return Center(child: Image.asset("assets/images/Logo.png"));
  }

  buildEmailTextFormField() {
    return CustomTextFormField(
      titleText: "Email",
      prefixIcon: Icon(Icons.email),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "Please Enter Email";
        }
        return null;
      },
    );
  }

  buildPassword() {
    return CustomTextFormField(
      titleText: "Password",
      obscureText: obscure,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: InkWell(
        onTap: () {
          obscure = !obscure;
          setState(() {});
        },
        child: obscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
      ),
    );
  }

  buildForgetText() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Forget Password",
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: Color(0xff5669FF),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  buildElevatedButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
          backgroundColor: Color(0xff5669FF),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  buildTextCreate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t Have Account ?  ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 5),
        InkWell(
          onTap: () {
            Navigator.push(context, AppRoute.register);
          },
          child: Text(
            " Create Account",
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

  buildDividerandOr() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Color(0xff5669FF),
            ),
          ),
          Text("Or", style: TextStyle(fontSize: 16, color: Color(0xff5669FF))),
          Expanded(
            child: Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Color(0xff5669FF),
            ),
          ),
        ],
      ),
    );
  }

  buildGoogleButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColor.appLightColor,
        side: BorderSide(color: Color(0xff5669FF)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/google.png", width: 26, height: 26),
          SizedBox(width: 5),
          Text(
            "Login With Google",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xff5669FF),
            ),
          ),
        ],
      ),
    );
  }
}
