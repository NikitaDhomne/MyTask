import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_software_lab/widgets/login_provider_button.dart';
import 'package:task_software_lab/widgets/orloginwith_text.dart';
import 'package:task_software_lab/widgets/stepWidget.dart';
import 'package:task_software_lab/widgets/widget_title.dart';

class SignUpPage1 extends StatelessWidget {
  SignUpPage1(
      {super.key,
      required this.screenHeight,
      required this.screenWidth,
      required this.nameController,
      required this.emailController,
      required this.phoneNumberController,
      required this.passwordController,
      required this.confirmPasswordController});
  final double screenHeight;
  final double screenWidth;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.02,
          ),
          StepWidget(title: 'Signup 1 of 4'),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          screen_title(
            title: "Welcome!",
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
          SizedBox(
            height: screenHeight * 0.03,
          ),
          OrLoginText(title: 'or signup with'),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffEEEDEC),
                prefixIcon: Icon(Icons.person_2_outlined),
                labelText: 'Full Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                labelStyle: TextStyle(color: Color(0xffA7A6A6)),
                contentPadding: EdgeInsets.zero),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Name is required.';
              }
              return null;
            },
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffEEEDEC),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
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
          SizedBox(
            height: screenHeight * 0.03,
          ),
          TextFormField(
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            maxLength: 10,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffEEEDEC),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                counterText: '',
                prefixIcon: Icon(Icons.phone_outlined),
                labelText: 'Phone Number',
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
          SizedBox(
            height: screenHeight * 0.03,
          ),
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffEEEDEC),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
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
          SizedBox(
            height: screenHeight * 0.03,
          ),
          TextFormField(
            controller: confirmPasswordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffEEEDEC),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              prefixIcon: Icon(Icons.lock_outline),
              contentPadding: EdgeInsets.zero,
              labelText: 'Re-enter Password',
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
              if (passwordController.text != confirmPasswordController.text) {
                return '* Password doesn\'t match';
              }

              return null;
            },
            obscureText: true,
          ),
          SizedBox(
            height: screenHeight * 0.15,
          )
        ],
      ),
    );
  }
}
