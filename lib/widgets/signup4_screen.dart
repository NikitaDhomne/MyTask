import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_software_lab/provider/user_data_provider.dart';
import 'package:task_software_lab/screens/signup_screen.dart';
import 'package:task_software_lab/widgets/stepWidget.dart';

class SignUpPage4 extends StatefulWidget {
  SignUpPage4(
      {Key? key,
      required this.screenHeight,
      required this.screenWidth,
      required this.daysOfWeek,
      required this.timeSlots})
      : super(key: key);
  final double screenHeight;
  final double screenWidth;
  final List<String> daysOfWeek;
  final List<List<String>> timeSlots;

  @override
  State<SignUpPage4> createState() => _SignUpPage4State();
}

class _SignUpPage4State extends State<SignUpPage4> {
  int selectedDayIndex = 0; // Initialize to Monday (index 0)

  @override
  Widget build(BuildContext context) {
    final timeSlotProvider = Provider.of<UserDataProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.screenHeight * 0.02,
        ),
        StepWidget(title: 'Signup 4 of 4'),
        SizedBox(
          height: widget.screenHeight * 0.01,
        ),
        Text(
          "Business Hours",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          height: widget.screenHeight * 0.03,
        ),
        Text(
          'Choose the hours your farm is open for pickups. This will allow customers to order deliveries.',
          style: TextStyle(
            fontFamily: 'BeVietnamPro',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xffBEBBB8),
          ),
        ),
        SizedBox(
          height: widget.screenHeight * 0.03,
        ),
        SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var index = 0; index < daysOfWeek.length; index++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDayIndex = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    padding: EdgeInsets.all(4),
                    margin: index == 0
                        ? EdgeInsets.only(left: 0)
                        : EdgeInsets.only(left: 2),
                    decoration: BoxDecoration(
                      color: selectedDayIndex == index
                          ? Color(0xffD5715B)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      daysOfWeek[index],
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        selectedDayIndex != -1
            ? Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 40,
                  ),
                  itemCount: timeSlots[selectedDayIndex].length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        timeSlotProvider.toggleSelectedTimeIndex(
                            selectedDayIndex, index);
                      },
                      child: SizedBox(
                        height: 40,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: timeSlotProvider.selectedTimeIndices
                                        .containsKey(selectedDayIndex) &&
                                    timeSlotProvider
                                        .selectedTimeIndices[selectedDayIndex]!
                                        .contains(index)
                                ? Colors.amber
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(timeSlots[selectedDayIndex][index]),
                        ),
                      ),
                    );
                  },
                ),
              )
            : Container(),
      ],
    );
  }
}
