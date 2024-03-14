import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_software_lab/screens/login_screen.dart';
import 'package:task_software_lab/widgets/onboarding_page_widget.dart';
import 'package:task_software_lab/widgets/textWithUnderline.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _timer?.cancel();
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      width: _currentPage == index ? 14 : 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _pages[_currentPage].color, // Use page color
                      ),
                      child: Text(
                        'Join the Movement!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'BeVietnamPro',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: TextWithUnderline(
                        title: 'Login',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<OnboardingPage> _pages = [
  OnboardingPage(
    title: 'Quality',
    description:
        'Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. ',
    imageUrl: 'assets/images/onboard_1.png',
    color: Color(0xff5EA25F), // Color for the first page
  ),
  OnboardingPage(
    title: 'Convenient',
    description:
        'Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.',
    imageUrl: 'assets/images/onboard_2.png',
    color: Color(0xffD5715B), // Color for the second page
  ),
  OnboardingPage(
    title: 'Local',
    description:
        'We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. ',
    imageUrl: 'assets/images/onboard_3.png',
    color: Color(0xffF8C569), // Color for the third page
  ),
];
