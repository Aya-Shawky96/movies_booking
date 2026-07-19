import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/registeration_provider.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart';
import 'sign_up.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var registrationProviderObject = Provider.of<RegistrationProvider>(context, listen: false,);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),

                // Login Image
                Center(
                  child: Image.asset(
                    "assets/loginimage.jpg",
                    height: 220,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Please Sign In to continue.",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 35),

                /// Email
                CustomTextField(
                  controller: emailController,
                  label: "Email",
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 18),

                /// Password
                CustomTextField(
                  controller: passwordController,
                  label: "Password",
                  prefixIcon: Icons.lock_outline,
                  obscure: true,
                  suffixIcon: Icons.visibility_off_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    if (value.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff123B63),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () async {

                      if (formKey.currentState!.validate()) {
                        await registrationProviderObject.loginDataProvider(
                          email: emailController.text,
                          password: passwordController.text,
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(registrationProviderObject.registrationModel?.message ?? "",),),
                        );

                        if (registrationProviderObject.registrationModel?.statusCode == true)
                        {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage(),),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// Register
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account? ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignUpScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff123B63),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}