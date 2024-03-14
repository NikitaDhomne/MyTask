import 'package:flutter/material.dart';
import 'package:task_software_lab/apis/resetPassword_api.dart';
import 'package:task_software_lab/model/resetpassword_request_model.dart';
import 'package:task_software_lab/model/resetpassword_response_model.dart';
import 'package:task_software_lab/screens/login_screen.dart';
import 'package:task_software_lab/widgets/app_title.dart';
import 'package:task_software_lab/widgets/submit_button.dart';
import 'package:task_software_lab/widgets/subtitleWithButton.dart';
import 'package:task_software_lab/widgets/widget_title.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.token});
  final String token;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  void resetPassword() async {
    ResetPasswordRequest resetPasswordRequest = ResetPasswordRequest();
    resetPasswordRequest.token = widget.token;
    resetPasswordRequest.password = passController.text;
    resetPasswordRequest.cpassword = confirmPassController.text;

    ResetPasswordResponse resetPasswordResponse =
        await resetPasswordApi(resetPasswordRequest);
    //await pref.setBool('key', true);

    print('***********************');

    if (resetPasswordResponse.message ==
        "Your password has been successfully changed.") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Unable to verify OTP, please try again.')));
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    } else if (resetPasswordResponse.message ==
        'Your password reset request failed, please try again.') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Your password reset request failed, please try again.')));
    } else if (resetPasswordResponse.message ==
        'Your password reset OTP was expired.') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Your password reset OTP was expired.')));
    } else if (resetPasswordResponse.message == 'Invalid token.') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid token.')));
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.06,
              ),
              screen_title(
                title: "Reset Password",
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              SubtitleWithButton(
                title1: 'Remember your password? ',
                title2: 'Login',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
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
                  controller: passController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline),
                    contentPadding: EdgeInsets.zero,
                    labelText: 'New Password',
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
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffEEEDEC),
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
                child: TextFormField(
                  controller: confirmPassController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline),
                    contentPadding: EdgeInsets.zero,
                    labelText: 'Confirm New Password',
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
                    if (passController.text != confirmPassController.text) {
                      return '* Password doesn\'t match';
                    }

                    return null;
                  },
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              SubmitButton(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                buttonName: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    resetPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
