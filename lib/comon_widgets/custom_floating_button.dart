import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../conversation/views/Conversation.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      delay: const Duration(milliseconds: 800),
      child: InkWell(
        onTap: () {
          Get.to(Conversation());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Image.asset("assets/img/center_navBar.png"),
        ),
      ),
    );
  }
}
