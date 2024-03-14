import 'package:flutter/material.dart';
import 'package:task_software_lab/screens/login_screen.dart';
import 'package:task_software_lab/widgets/submit_button.dart';
import 'package:task_software_lab/widgets/widget_title.dart';

class SignUpConfirmation extends StatelessWidget {
  const SignUpConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/Vector.png'),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              screen_title(title: "You’re all done!"),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                'Hang tight! We are currently reviewing your account and will follow up with you in 2-3 business days. In the meantime, you can setup your inventory.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'BeVietnamPro',
                  color: Color(0xff898989),
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: SubmitButton(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            buttonName: 'Got it!',
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));
            }),
      ),
    );
  }
}
