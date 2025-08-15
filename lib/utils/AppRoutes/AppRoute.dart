import 'package:assignment/ui/screens/google_login/google_login.dart';
import 'package:assignment/ui/screens/register/register.dart';
import 'package:flutter/material.dart';

abstract final class AppRoute {
  static Route get register=>MaterialPageRoute(builder: (context) => RegisterScreen(),);
 static Route get googleLogin=>MaterialPageRoute(builder:
     (context) => GoogleLogin(),);
}