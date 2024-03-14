import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:task_software_lab/provider/user_data_provider.dart';
import 'package:task_software_lab/widgets/stepWidget.dart';
import 'package:task_software_lab/widgets/widget_title.dart';

class SignUpPage3 extends StatefulWidget {
  SignUpPage3(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;

  @override
  State<SignUpPage3> createState() => _SignUpPage3State();
}

class _SignUpPage3State extends State<SignUpPage3> {
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result == null) return;
    Provider.of<UserDataProvider>(context, listen: false)
        .setSelectedFileName(result.files.first.name);
  }

  void _deleteSelectedFile() {
    Provider.of<UserDataProvider>(context, listen: false).deleteSelectedFile();
  }

  @override
  Widget build(BuildContext context) {
    final _selectedFileName =
        Provider.of<UserDataProvider>(context).selectedFileName;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.screenHeight * 0.02,
        ),
        StepWidget(title: 'Signup 3 of 4'),
        SizedBox(
          height: widget.screenHeight * 0.01,
        ),
        screen_title(
          title: "Verification",
        ),
        SizedBox(
          height: widget.screenHeight * 0.03,
        ),
        Text(
          'Attached proof of Department of Agriculture registrations i.e. Florida Fresh, USDA Approved, USDA Organic',
          style: TextStyle(
              fontFamily: 'BeVietnamPro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xffBEBBB8)),
        ),
        SizedBox(
          height: widget.screenHeight * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Attach proof of registration',
              style: TextStyle(
                  fontFamily: 'BeVietnamPro',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff261C12)),
            ),
            CircleAvatar(
              backgroundColor: Color(0xffD5715B),
              radius: 25,
              child: IconButton(
                  onPressed: _pickFile,
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        SizedBox(
          height: widget.screenHeight * 0.03,
        ),
        _selectedFileName != null
            ? Container(
                height: 50,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Color(0xffEEEDEC),
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        _selectedFileName.toString(),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: _deleteSelectedFile,
                    ),
                  ],
                ),
              )
            : Container(),
        SizedBox(
          height: widget.screenHeight * 0.4,
        )
      ],
    );
  }
}
