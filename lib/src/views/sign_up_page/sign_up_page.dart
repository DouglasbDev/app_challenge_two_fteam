import 'dart:ui';

import 'package:app_challenge_two_fteam/src/views/login_page/login_page.dart';
import 'package:app_challenge_two_fteam/src/views/settings_page/settings_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qlorian/qlorian.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  var passwordCache = '';
  var passwordCacheConfirm = '';
  bool obscuredTextPassword = false;
  @override
  Widget build(BuildContext context) {
    final colorSurface = Theme.of(context).colorScheme.surface;
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: widthSize * 0.064,
              right: widthSize * 0.064,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '👋 Hello,\n Are you new here',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: widthSize * 0.0693),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                          text: 'if you have an account/',
                          style: TextStyle(
                              fontSize: 16, color: Color(0xffC4C4C4))),
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffB9B9B9)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: widthSize * 0.170),
          Container(
            padding: EdgeInsets.only(
              left: widthSize * 0.064,
              right: widthSize * 0.064,
              top: widthSize * 0.064,
            ),
            decoration: BoxDecoration(
              color: colorSurface,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widthSize * 0.032),
                topRight: Radius.circular(widthSize * 0.032),
              ),
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Full Name',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                      prefix: Icons.person,
                      hintText: 'Douglas Oliveira',
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'This field is required';
                        }
                        if (text.length < 8) {
                          return 'The name is too short';
                        }
                        if (!RegExp(r'^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}$')
                            .hasMatch(text)) {
                          return 'Full Name is invalid';
                        }
                      }),
                  SizedBox(height: widthSize * 0.074),
                  const Text(
                    'E-mail',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                      prefix: Icons.email_outlined,
                      hintText: 'Douglas@gmail.com',
                      validator: (text) {
                        if (!RegExp(r'[a-zA-Z0-9.-_]+@[a-zA-Z0-9-_]+\..+')
                            .hasMatch(text ?? '')) {
                          return 'Enter a valid email address';
                        }
                        if (text == null || text.isEmpty) {
                          return 'This field is required';
                        }
                      }),
                  SizedBox(height: widthSize * 0.074),
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                    prefix: Icons.lock,
                    hintText: 'Password',
                    onChanged: (text) => passwordCache = text,
                    obscureText: !obscuredTextPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuredTextPassword = !obscuredTextPassword;
                          });
                        },
                        icon: Icon(obscuredTextPassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'This field is required';
                      }
                      if (passwordCacheConfirm != passwordCache) {
                        return 'The password is not the same';
                      }
                    },
                  ),
                  SizedBox(height: widthSize * 0.074),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: widthSize * 0.064),
                  WidgetTextFormField(
                    prefix: Icons.lock,
                    hintText: 'Confirm Password',
                    onChanged: (text) => passwordCacheConfirm = text,
                    obscureText: !obscuredTextPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscuredTextPassword = !obscuredTextPassword;
                          });
                        },
                        icon: Icon(obscuredTextPassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'This field is required';
                      }
                      if (passwordCacheConfirm != passwordCache) {
                        return 'The password is not the same';
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: widthSize * 0.229, bottom: widthSize * 0.0373),
                    child: WidgetButton(
                        title: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsPage()),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
