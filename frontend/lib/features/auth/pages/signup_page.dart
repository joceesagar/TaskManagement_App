import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const SignupPage(),
      );
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void signUpUser() {
    if (formKey.currentState!.validate()) {
      // store the user data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up.",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Username",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Name field cannot be empty";
                }
                if (value.length < 3) {
                  return "Username must be at least 3 characters long";
                }
                if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                  return "Username can only contain letters and numbers";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Email field cannot be empty";
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Password",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Password field cannot be empty";
                }
                if (value.length < 8) {
                  return "Password must be at least 8 characters long";
                }
                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  return "Password must contain at least one uppercase letter";
                }
                if (!RegExp(r'[a-z]').hasMatch(value)) {
                  return "Password must contain at least one lowercase letter";
                }
                if (!RegExp(r'[0-9]').hasMatch(value)) {
                  return "Password must contain at least one digit";
                }
                if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                  return "Password must contain at least one special character (!@#\$&*~)";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: signUpUser,
              child: const Text(
                "SIGN Up",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(LoginPage.route());
              },
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
