import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_software_lab/apis/register_api.dart';
import 'package:task_software_lab/model/register_request_model.dart';
import 'package:task_software_lab/model/register_response_model.dart';
import 'package:task_software_lab/provider/user_data_provider.dart';
import 'package:task_software_lab/screens/login_screen.dart';
import 'package:task_software_lab/screens/signup_confirmation_screen.dart';
import 'package:task_software_lab/widgets/app_title.dart';
import 'package:task_software_lab/widgets/signup1_screen.dart';
import 'package:task_software_lab/widgets/signup2_screen.dart';
import 'package:task_software_lab/widgets/signup3_screen.dart';
import 'package:task_software_lab/widgets/signup4_screen.dart';
import 'package:task_software_lab/widgets/submit_button.dart';
import 'package:task_software_lab/widgets/textWithUnderline.dart';

const List<String> daysOfWeek = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];

const List<List<String>> timeSlots = [
  [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm'
  ], // Mon
  [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm'
  ], // Tue
  [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm'
  ], // Wed
  [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm'
  ], // Thu
  [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm'
  ], // Fri
  [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm'
  ], // Sat
  [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm'
  ], // Sun
];

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final businessNameController = TextEditingController();
  final informalNameController = TextEditingController();
  final streetAddressController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();

  String? _selectedState;
  // List of Indian states
  final List<String> indianStates = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Chandigarh',
    'Lakshadweep',
    'Delhi',
    'Puducherry',
  ];

  void _updateSelectedState(String value) {
    setState(() {
      _selectedState = value;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    businessNameController.dispose();
    informalNameController.dispose();
    streetAddressController.dispose();
    cityController.dispose();
    zipCodeController.dispose();
    super.dispose();
  }

  void signup() async {
    String? selectedFileName =
        Provider.of<UserDataProvider>(context, listen: false).selectedFileName;
    RegisterRequest registerRequest = RegisterRequest();
    registerRequest.fullName = nameController.text;
    registerRequest.email = emailController.text;
    registerRequest.phone = phoneNumberController.text;
    registerRequest.password = passController.text;
    registerRequest.role = "farmer";
    registerRequest.businessName = businessNameController.text;
    registerRequest.informalName = informalNameController.text;
    registerRequest.address = streetAddressController.text;
    registerRequest.city = cityController.text;
    registerRequest.state = indianStates.toString();
    registerRequest.zipCode = int.parse(zipCodeController.text);
    registerRequest.registrationProof = selectedFileName;
    registerRequest.deviceToken = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";
    registerRequest.type = "email/facebook/google/apple";
    registerRequest.socialId = "0imfnc8mVLWwsAawjYr4Rx-Af50DDqtlx";

    final timeSlotProvider =
        Provider.of<UserDataProvider>(context, listen: false);

    // Iterate over each day's selected time indices and add them to the registerRequest
    timeSlotProvider.selectedTimeIndices.forEach((dayIndex, timeIndices) {
      String day = daysOfWeek[dayIndex];
      List<String> selectedTimeSlots =
          timeIndices.map((index) => timeSlots[dayIndex][index]).toList();
      print('/////////////');
      // Set the selected time slots for the current day in the registerRequest
      switch (day) {
        case 'M':
          registerRequest.businessHours?.mon = selectedTimeSlots;
          break;
        case 'T':
          registerRequest.businessHours?.tue = selectedTimeSlots;
          break;
        case 'W':
          registerRequest.businessHours?.wed = selectedTimeSlots;
          break;
        case 'Th':
          registerRequest.businessHours?.thu = selectedTimeSlots;
          break;
        case 'F':
          registerRequest.businessHours?.fri = selectedTimeSlots;
          break;
        case 'S':
          registerRequest.businessHours?.sat = selectedTimeSlots;
          break;
        case 'Su':
          registerRequest.businessHours?.sun = selectedTimeSlots;
          break;
        default:
          break;
      }
    });

    RegisterResponse registerResponse = await registerApi(registerRequest);
    print('***********************');
    print(registerResponse.message);

    print('Form submitted');

    if (registerResponse.message == 'Registered.') {
      print('Token------>');

      Future.delayed(
        const Duration(seconds: 2),
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignUpConfirmation()));
    } else if (registerResponse.message == 'Registration failed.') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Registration failed. Please try again.')));
    } else if (registerResponse.message == 'Email already exists.') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User Already Exists.')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Something went wrong.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    String? selectedFileName =
        Provider.of<UserDataProvider>(context).selectedFileName;
    print(selectedFileName);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var screenHeight = mediaQuery.size.height;
    var screenWidth = mediaQuery.size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppTitle(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
        child: Form(
          key: _formKey,
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: <Widget>[
              SignUpPage1(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                nameController: nameController,
                emailController: emailController,
                phoneNumberController: phoneNumberController,
                passwordController: passController,
                confirmPasswordController: confirmPassController,
              ),
              SignUpPage2(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                businessNameController: businessNameController,
                informalNameController: informalNameController,
                streetAddressController: streetAddressController,
                cityController: cityController,
                zipcode: zipCodeController,
                indianStates: indianStates,
                selectedState: _selectedState,
                updateSelectedState: _updateSelectedState,
              ),
              SignUpPage3(screenHeight: screenHeight, screenWidth: screenWidth),
              SignUpPage4(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                daysOfWeek: daysOfWeek,
                timeSlots: timeSlots,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentPageIndex > 0
                ? IconButton(
                    onPressed: _previousStep,
                    icon: Icon(Icons.arrow_back),
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: TextWithUnderline(title: 'Login')),
            SubmitButton(
              screenHeight: screenHeight,
              screenWidth: screenWidth / 1.7,
              buttonName: _currentPageIndex == 3 ? 'Submit' : 'Continue',
              onPressed: _currentPageIndex == 3 ? signup : _nextStep,
            )
            // ElevatedButton(
            //   onPressed: _currentPageIndex == 2 ? _submitForm : _nextStep,
            //   child: Text(_currentPageIndex == 2 ? 'Submit' : 'Continue'),
            // ),
          ],
        ),
      ),
    );
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousStep() {
    _pageController.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     print(nameController.text);
  //     print(emailController.text);

  //     print('Form submitted');
  //   }
  // }
}
