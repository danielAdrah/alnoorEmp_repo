import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../notification_/views/notification.dart';
import '../theme.dart';

class CustomAppBar2 extends StatelessWidget {
  CustomAppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Get.to(NotificationView());
              },
              icon: Image.asset("assets/img/white_notif_icon.png")),
          Text(
            "الحساب",
            style: TextStyle(
                color: TColor.white, fontWeight: FontWeight.w400, fontSize: 20),
          ),
          InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset("assets/img/white_arrowBack.png"))
        ],
      ),
    );
  }
}
