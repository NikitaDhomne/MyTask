import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_software_lab/apis/verifyOtp_api.dart';
import 'package:task_software_lab/model/verifyotp_request_model.dart';
import 'package:task_software_lab/model/verifyotp_response_model.dart';
import 'package:task_software_lab/screens/login_screen.dart';
import 'package:task_software_lab/screens/reset_password_screen.dart';
import 'package:task_software_lab/widgets/app_title.dart';
import 'package:task_software_lab/widgets/submit_button.dart';
import 'package:task_software_lab/widgets/subtitleWithButton.dart';
import 'package:task_software_lab/widgets/textWithUnderline.dart';
import 'package:task_software_lab/widgets/widget_title.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<TextEditingController> _controllers =
      List.generate(5, (index) => TextEditingController());
  List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

  String getOTP() {
    return _controllers.map((controller) => controller.text).join();
  }

  void verifyotp() async {
    VerifyOtpRequest verifyOtpRequest = VerifyOtpRequest();
    String otp = getOTP();
    verifyOtpRequest.otp = otp;

    VerifyOtpResponse verifyOtpResponse = await verifyOtpApi(verifyOtpRequest);
    //await pref.setBool('key', true);

    print('***********************');

    if (verifyOtpResponse.message == "OTP verified successful.") {
      final token = verifyOtpResponse.token;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResetPasswordPage(
                token: token.toString(),
              )));
    } else if (verifyOtpResponse.message ==
        'Unable to verify OTP, please try again.') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Unable to verify OTP, please try again.')));
    } else if (verifyOtpResponse.message == 'Invalid OTP.') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid OTP.')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Something went wrong.')));
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 5; i++) {
      _controllers[i].dispose();
      _focusNodes[i].dispose();
    }
    super.dispose();
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
                title: "Verify OTP",
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
              OTPFields(controllers: _controllers, focusNodes: _focusNodes),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              SubmitButton(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                buttonName: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    verifyotp();
                  }
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              GestureDetector(
                  onTap: () {}, child: TextWithUnderline(title: 'Resend Code'))
            ],
          ),
        ),
      ),
    );
  }
}

class OTPFields extends StatelessWidget {
  const OTPFields({
    super.key,
    required List<TextEditingController> controllers,
    required List<FocusNode> focusNodes,
  })  : _controllers = controllers,
        _focusNodes = focusNodes;

  final List<TextEditingController> _controllers;
  final List<FocusNode> _focusNodes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) => SizedBox(
          width: 50,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffEEEDEC),
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
            ),
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              keyboardType: TextInputType.number,
              maxLength: 1,
              textAlign: TextAlign.center,
              decoration:
                  InputDecoration(counterText: '', border: InputBorder.none),
              onChanged: (value) {
                if (value.isNotEmpty && index < 4) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
