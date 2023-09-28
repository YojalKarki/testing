
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/pages/user.dart';
import 'package:testing/routes/routes.dart';

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
          child: Form(
            key: _formField,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Colors.purple
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                controller: emailController,
                hint: 'Please enter your e-mail',
                keyboardType: TextInputType.emailAddress,
                icons: Icon(Icons.email),
                validator: (value) {
                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\[a-zA-Z]+").hasMatch(value!);
                  if(value.isEmpty) {
                    return "Enter Email";
                  }

                  else if(!emailValid){
                    return "Enter Valid email";
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                controller: nameController,
                hint: 'Please enter your name!',
                keyboardType: TextInputType.text, icons: const Icon(Icons.person),
                validator: (value) {
                  if(nameController.text.isEmpty) {
                    return "Please Enter your name";
                  }
                },

              ),
              const SizedBox(
                height: 30,
              ),
              AppTextField(
                controller: passwordController,
                hint: 'Please enter your password',
                keyboardType: TextInputType.visiblePassword, icons: Icon(Icons.lock),
                validator: (value) {
                  if(value.isEmpty) {
                    return "Enter email";
                  }
                  else if(passwordController.text.length < 8) {
                    return "Password must be more than 8 characters";
                  }
                },

              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<User>().username = nameController.text;
                    Navigator.of(context).pushNamed(RouteManager.homePage);
                    if(_formField.currentState!.validate()) {
                      emailController.clear();
                      passwordController.clear();
                      nameController.clear();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.keyboardType, required this.icons, required this.validator});

  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final Icon icons;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      //obscureText: true,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: icons,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        border: const OutlineInputBorder(),
        labelText: hint,
        labelStyle: const TextStyle(color: Colors.black54),
      ),
    );
  }
}
