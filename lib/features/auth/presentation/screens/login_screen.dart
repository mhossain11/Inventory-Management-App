import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/features/auth/presentation/widgets/customField.dart';
import 'package:inventoryapp/features/auth/presentation/widgets/customPasswordField.dart';

import '../controller/auth_controllere.dart';
import '../widgets/snackBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final obscurePasswordNotifier = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/inventory.png',height: 100,width: 150,),
                  Text('Inventory Login',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomField(
                        controller: emailController,
                    ),
                  ),
                  Gap(5),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomPasswordField(controller: passwordController,),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: GestureDetector(
                            onTap: (){
                              //TODO Go to Screen
                              showCustomSnackBar(
                                context,
                                "Go to Forgot password Screen",
                                backgroundColor: Colors.green,
                                icon: Icons.check_circle,
                              );
                            },
                            child: Text('Forgot password?',style: TextStyle(fontSize: 14,color:Colors.grey),)),
                      )
                    ],
                  ),

                  Gap(20),
                  ElevatedButton(
                    style: ButtonStyle(fixedSize:WidgetStateProperty.all(Size(200, 50)) ),
                      onPressed: ()async{
                        if (formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          final emailAddress = emailController.text.trim();

                          final password = passwordController.text.trim();

                          await _authController.login(
                            email: emailAddress,
                            password: password,
                          );
                        }
                      },
                      child: Text('Sign In',style: TextStyle(fontSize: 20),)),

                  Gap(20),
                  RichText(
                      text: TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                                text: 'Create Account',
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap= () {
                                    showCustomSnackBar(
                                      context,
                                      "Click successful!",
                                      backgroundColor: Colors.green,
                                      icon: Icons.check_circle,
                                    );
                                  }
                            ),
                          ]
                      )),
                ],
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
