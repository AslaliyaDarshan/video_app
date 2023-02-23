import 'package:flutter/material.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class UserBirthdayScreen extends StatefulWidget {
  const UserBirthdayScreen({Key? key}) : super(key: key);

  @override
  State<UserBirthdayScreen> createState() => _UserBirthdayScreenState();
}

class _UserBirthdayScreenState extends State<UserBirthdayScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GlobalWidget.backgroundColor(Column()),
      ),
    );
  }
}
