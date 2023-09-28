import 'package:flutter/material.dart';
import 'package:testing/pages/home_page.dart';
import 'package:testing/pages/login.dart';

class RouteManager {
static const String loginPage = '/';
static const String homePage = '/homePage';


static Route<dynamic> generateRoute(RouteSettings settings) {
switch(settings.name) {
  case loginPage:
    return MaterialPageRoute(builder: (context) => LoginPage()
    );
  case homePage:
    return MaterialPageRoute(builder: (context) => HomePage()
    );

  default:
    throw const FormatException('Login Failed! try Again');
    
}
}
}

