import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MainPageState();
}

class _MainPageState extends State<LoginPage> {
  final _formField = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passToggle = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
          Form(key: _formField,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                const Text('Welcome', style:TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Colors.purple
                  ),
                ),
                const SizedBox(height: 30,
                ),
                TextFormField
                  (
                  validator:
                      (value) {
                    bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Please enter your email";
                    } else if (!emailValid) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'eg@gmail.com',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if(value!.isEmpty) {
                      return "Enter your Username";
                    }
                  },
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Peter Rambo',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your password";
                    } else if (passwordController.text.length < 8) {
                      return "Password must be more than 8 characters";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  controller: passwordController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                    });},
                    child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue.shade400)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 40,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formField.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: const HomePage(),
                                type: PageTransitionType.rightToLeft));
                        emailController.clear();
                        passwordController.clear();
                        nameController.clear();
                      }
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],),
          ),
        ),
      ),
    );
  }
}
