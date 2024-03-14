import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_software_lab/apis/login_api.dart';
import 'package:task_software_lab/model/login_request_model.dart';
import 'package:task_software_lab/model/login_response_model.dart';
import 'package:task_software_lab/screens/forgot_password_screen.dart';
import 'package:task_software_lab/screens/homepage_screen.dart';
import 'package:task_software_lab/screens/signup_screen.dart';
import 'package:task_software_lab/widgets/app_title.dart';
import 'package:task_software_lab/widgets/login_provider_button.dart';
import 'package:task_software_lab/widgets/orloginwith_text.dart';
import 'package:task_software_lab/widgets/submit_button.dart';
import 'package:task_software_lab/widgets/subtitleWithButton.dart';
import 'package:task_software_lab/widgets/widget_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passController = TextEditingController();

  void login() async {
    LoginRequest loginRequest = LoginRequest();
    loginRequest.email = emailController.text;
    loginRequest.password = passController.text;
    loginRequest.role = "farmer";
    loginRequest.deviceToken = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
    loginRequest.type = "email/facebook/google/apple";
    loginRequest.socialId = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";

    LoginResponse loginResponse = await loginApi(loginRequest);
    //await pref.setBool('key', true);

    print('***********************');

    if (loginResponse.message == "Login successful.") {
      final token = loginResponse.token;
      print('Token------>');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Homepage(
                token: token.toString(),
                email: loginResponse.user!.email.toString(),
                name: loginResponse.user!.fullName.toString(),
              )));
    } else if (loginResponse.message == 'Account does not exist.') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account does not exist.')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Something went wrong.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppTitle(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                screen_title(
                  title: "Welcome back!",
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                SubtitleWithButton(
                  title1: 'New here? ',
                  title2: 'Create Account',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => RegistrationScreen()));
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.08,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEEEDEC),
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.alternate_email),
                        labelText: 'Enter Address',
                        labelStyle: TextStyle(color: Color(0xffA7A6A6)),
                        contentPadding: EdgeInsets.zero),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '* Email is required.';
                      }
                      if (!value.contains('@')) {
                        return '* Must contain @.';
                      }
                      if (!value.endsWith('.com') &&
                          !value.endsWith('.in') &&
                          !value.endsWith('.co') &&
                          !value.endsWith('.gov') &&
                          !value.endsWith('.edu')) {
                        return '* Enter valid email id';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEEEDEC),
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                  ),
                  child: TextFormField(
                    controller: passController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock_outline),
                      contentPadding: EdgeInsets.zero,
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xffA7A6A6)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '* Password is required';
                      }
                      if (value.length < 6) {
                        return '* Password should have atleast 6 characters long';
                      }
                      if (value.length > 15) {
                        return '* Password should not be greater than 15 characters';
                      }

                      return null;
                    },
                    obscureText: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                      },
                      child: Text('Forgot?',
                          style: TextStyle(
                              color: Color(
                                0xffD5715B,
                              ),
                              fontFamily: 'BeVietnamPro',
                              fontSize: 14,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SubmitButton(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  buttonName: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login();
                    }
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                OrLoginText(
                  title: 'or login with',
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Buildloginprovider(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      image: 'assets/images/google_logo.png',
                    ),
                    Buildloginprovider(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      image: 'assets/images/apple_logo.png',
                    ),
                    Buildloginprovider(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      image: 'assets/images/facebook_logo.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
