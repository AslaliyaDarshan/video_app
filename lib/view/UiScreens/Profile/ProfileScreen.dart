import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalWidget.backgroundColor(
        Stack(
          children: [
            SizedBox(
              height: 50.h,
              width: 100.w,
              child: Image.asset(
                "assets/image/pretty-girl.gif",
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  height(27.h),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Colors.white)),
                    child: CircleAvatar(
                      maxRadius: 120,
                      backgroundImage: AssetImage("assets/image/boy.jpg"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
