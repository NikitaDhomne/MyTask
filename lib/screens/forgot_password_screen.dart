import 'package:flutter/material.dart';
import 'package:task_software_lab/apis/forgotPassword_api.dart';
import 'package:task_software_lab/model/forgotpassword_request_model.dart';
import 'package:task_software_lab/model/forgotpassword_response_model.dart';
import 'package:task_software_lab/screens/login_screen.dart';
import 'package:task_software_lab/screens/otp_verify_screen.dart';
import 'package:task_software_lab/widgets/app_title.dart';
import 'package:task_software_lab/widgets/submit_button.dart';
import 'package:task_software_lab/widgets/subtitleWithButton.dart';
import 'package:task_software_lab/widgets/widget_title.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  String _phoneNumberLabelText = 'Phone Number';

  void forgotPassword() async {
    ForgotPasswordRequest forgotPasswordRequest = ForgotPasswordRequest();
    forgotPasswordRequest.mobile = phoneNumberController.text;

    ForgotPasswordResponse forgotPasswordResponse =
        await forgotPasswordApi(forgotPasswordRequest);
    //await pref.setBool('key', true);

    print('***********************');

    if (forgotPasswordResponse.message == "OTP sent to your mobile.") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OTPVerificationPage()));
    } else if (forgotPasswordResponse.message ==
        'Couldn\'t send an OTP, please try again.') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Couldn\'t send an OTP, please try again.')));
    } else if (forgotPasswordResponse.message ==
        'Account with this mobile number does not exist.') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Account with this mobile number does not exist.')));
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
                title: "Forgot Password?",
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
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      counterText: '',
                      prefixIcon: Icon(Icons.phone_outlined),
                      labelText: _phoneNumberLabelText,
                      labelStyle: TextStyle(color: Color(0xffA7A6A6)),
                      contentPadding: EdgeInsets.zero),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Phone Number is required.';
                    }
                    if (value.length != 10) {
                      return '* Must contain exactly 10 digits.';
                    }
                    if (int.tryParse(value) == null) {
                      return '* Must contain only numeric digits.';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              SubmitButton(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                buttonName: 'Send Code',
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {}
                  forgotPassword();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
