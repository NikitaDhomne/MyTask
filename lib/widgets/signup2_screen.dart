import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_software_lab/widgets/stepWidget.dart';
import 'package:task_software_lab/widgets/widget_title.dart';

class SignUpPage2 extends StatefulWidget {
  SignUpPage2({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.businessNameController,
    required this.informalNameController,
    required this.streetAddressController,
    required this.cityController,
    required this.zipcode,
    required this.indianStates,
    required this.selectedState,
    required this.updateSelectedState,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final TextEditingController businessNameController;
  final TextEditingController informalNameController;
  final TextEditingController streetAddressController;
  final TextEditingController cityController;
  final TextEditingController zipcode;
  final List<String> indianStates; // Receive indianStates here
  final String? selectedState;
  final Function(String) updateSelectedState;

  @override
  State<SignUpPage2> createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  late String? selectedState;

  @override
  void initState() {
    super.initState();
    // Set initial selected state value when the widget initializes
    selectedState = widget.selectedState;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.screenHeight * 0.02,
          ),
          StepWidget(title: 'Signup 2 of 4'),
          SizedBox(
            height: widget.screenHeight * 0.01,
          ),
          screen_title(
            title: "Farm Info",
          ),
          SizedBox(
            height: widget.screenHeight * 0.03,
          ),
          TextFormField(
            controller: widget.businessNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffEEEDEC),
              prefixIcon: Icon(Icons.person_2_outlined),
              labelText: 'Business Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              labelStyle: TextStyle(color: Color(0xffA7A6A6)),
              contentPadding: EdgeInsets.zero,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Business Name is required.';
              }
              return null;
            },
          ),
          SizedBox(
            height: widget.screenHeight * 0.03,
          ),
          TextFormField(
            controller: widget.informalNameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffEEEDEC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.alternate_email),
              labelText: 'Informal Name',
              labelStyle: TextStyle(color: Color(0xffA7A6A6)),
              contentPadding: EdgeInsets.zero,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Informal Name is required.';
              }
              return null;
            },
          ),
          SizedBox(
            height: widget.screenHeight * 0.03,
          ),
          TextFormField(
            controller: widget.streetAddressController,
            keyboardType: TextInputType.text,
            maxLength: 10,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffEEEDEC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              counterText: '',
              prefixIcon: Icon(Icons.phone_outlined),
              labelText: 'Street Address',
              labelStyle: TextStyle(color: Color(0xffA7A6A6)),
              contentPadding: EdgeInsets.zero,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* Street Address is required.';
              }
              return null;
            },
          ),
          SizedBox(
            height: widget.screenHeight * 0.03,
          ),
          TextFormField(
            controller: widget.cityController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffEEEDEC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.lock_outline),
              labelText: 'City',
              labelStyle: TextStyle(color: Color(0xffA7A6A6)),
              contentPadding: EdgeInsets.zero,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '* City is required';
              }
              return null;
            },
          ),
          SizedBox(
            height: widget.screenHeight * 0.03,
          ),
          Row(
            children: [
              Container(
                height: 46,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color: Color(0xffEEEDEC),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: widget.screenWidth * 0.3, // Adjust the width here
                child: PopupMenuButton(
                  initialValue: selectedState,
                  itemBuilder: (BuildContext context) {
                    return widget.indianStates.map((String value) {
                      return PopupMenuItem<String>(
                        height: 30,
                        value: value,
                        child: Text(value),
                      );
                    }).toList();
                  },
                  onSelected: (String value) {
                    setState(() {
                      selectedState = value;
                      // Update selected state in parent widget
                      widget.updateSelectedState(value);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        selectedState != null && selectedState!.length > 10
                            ? selectedState!.substring(0, 9) + '..'
                            : selectedState ?? 'State',
                        style: selectedState != null
                            ? TextStyle(color: Colors.black)
                            : TextStyle(color: Colors.grey),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                width: widget.screenWidth * 0.5,
                child: TextFormField(
                  controller: widget.zipcode,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffEEEDEC),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    counterText: '',
                    labelText: 'Zip Code',
                    labelStyle: TextStyle(color: Color(0xffA7A6A6)),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '* Zip Code is required';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: widget.screenHeight * 0.30,
          ),
        ],
      ),
    );
  }
}
