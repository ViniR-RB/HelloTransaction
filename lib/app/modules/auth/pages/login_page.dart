import 'package:flutter/material.dart';

import 'custom_obscure_text_field.dart';
import 'custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.3,
              child: Stack(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Positioned(
                            left: -100,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                            )),
                        const Positioned(child: CircleAvatar()),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              RichText(
                                  text: const TextSpan(
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 32),
                                children: [
                                  TextSpan(text: 'Sign in to your\n'),
                                  TextSpan(text: 'Account\n'),
                                  TextSpan(
                                      text: 'Sign in to your Account',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20)),
                                ],
                              ))
                            ],
                          ),
                        )
                      ]),
                ],
              ),
            ),
            Container(
              height: size.height * 0.7,
              color: Colors.white,
              child: Column(
                children: [
                  CustomFormField(
                    controller: _emailController,
                    label: 'E-mail',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomObscureTextField(
                    controller: _passwordController,
                    label: 'Password',
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
