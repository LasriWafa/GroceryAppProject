import 'package:flutter/material.dart';
import 'package:grocery_app/components/my_textfield.dart';
import 'package:grocery_app/components/my_button.dart';
import 'package:grocery_app/services/auth/auth_service.dart';
class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmpasswordController = TextEditingController();

  void register() async {
  // get auth service
  final _authService = AuthService();

  // check if passwords match -> create user
  if (passwordController.text == confirmpasswordController.text) {
    // try creating user
    try {
      await _authService.signUpWithEmailPassword(
        emailController.text,
        passwordController.text,
      );

    } catch (e) {
      // display any errors
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  // if passwords don't match -> show error
  else {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Passwords don't match!"),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ), // Icon

            const SizedBox(height: 25),

            // message, app slogan
            Text(
              "Let's Create an account for you! ",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ), // Text

            const SizedBox(height: 25),


            // email textfield
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ), // MyTextField
            const SizedBox(height: 25),

            // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ), // MyTextField
                 const SizedBox(height: 25),

            // confirm password textfield
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ), // MyTextField
                 const SizedBox(height: 25),

            // sign up button
                MyButton(
                  text: "Sign Up",
                  onTap: register,
                ), // MyButton

            // already have an account? Login now
              const SizedBox(height: 25),        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ), // Text

                const SizedBox(width: 4),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), // GestureDetector
              ],
            ), // Row
          ],
        ),
      ),
    );
  }
}
