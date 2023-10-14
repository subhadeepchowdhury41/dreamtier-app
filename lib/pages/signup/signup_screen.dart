import 'package:dreamtier/pages/home/home_screen.dart';
import 'package:dreamtier/pages/login/login_screen.dart';
import 'package:dreamtier/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(13),
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/light_bg_title.png',
                      height: MediaQuery.of(context).size.height / 3,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.7,
                                      color: Color.fromARGB(255, 24, 54, 221)),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.7,
                                      color: Color.fromARGB(255, 24, 54, 221)),
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name';
                              } else if (value.length < 3) {
                                return 'Name should be greater than 3 character';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              hintText: 'Phone',
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.7,
                                      color: Color.fromARGB(255, 24, 54, 221)),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.7,
                                      color: Color.fromARGB(255, 24, 54, 221)),
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              if (!RegExp(pattern).hasMatch(value)) {
                                return 'Enter valid phone number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.7,
                                      color: Color.fromARGB(255, 24, 54, 221)),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.7,
                                      color: Color.fromARGB(255, 24, 54, 221)),
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.7,
                                      color: Color.fromARGB(255, 24, 54, 221)),
                                  borderRadius: BorderRadius.circular(7)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1.7,
                                      color: Color.fromARGB(255, 24, 54, 221)),
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                          ),

                          //
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child:
                                        Divider(color: Colors.grey.shade400)),
                                const Text(
                                  '\t\tOR\t\t',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                    child:
                                        Divider(color: Colors.grey.shade400)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Google, Facebook Singup

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2.5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.blueGrey,
                                        width: 1.0,
                                      )),
                                  child: AnyLogo.tech.google.image(
                                    height: 42,
                                    width: 42,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2.5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.blueGrey,
                                      width: 1.0,
                                    )),
                                child: AnyLogo.tech.meta.image(
                                  height: 42,
                                  width: 42,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(double.infinity, 50),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 24, 54, 221)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await ref
                                .read(authProvider.notifier)
                                .signUpWithDetails(
                                  _emailController.text,
                                  _passwordController.text,
                                  _phoneController.text,
                                  _nameController.text,
                                )
                                .then((value) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => const HomeScreen(),
                                ),
                              );
                            }).catchError((e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text((e as FirebaseAuthException)
                                      .code
                                      .toString()),
                                ),
                              );
                            });
                          }
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already Have an Account',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '  LogIn',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => const LoginPage(),
                              ),
                            );
                          },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
