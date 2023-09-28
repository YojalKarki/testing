import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/user.dart';
import 'package:testing/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => User(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteManager.loginPage,
          onGenerateRoute: RouteManager.generateRoute,
        );
      },
    );
  }
}
