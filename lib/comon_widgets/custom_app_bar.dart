import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../notification_/views/notification.dart';
import '../theme.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final String name;
  const CustomAppBar({super.key, required this.title, required this.name});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInLeftBig(
            delay: Duration(milliseconds: 800),
            child: IconButton(
                onPressed: () {
                  Get.to(NotificationView());
                },
                icon: Image.asset("assets/img/notification_icon.png")),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.title,
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(color: TColor.primary),
                  ), //in this text it will be the TextController from the textfield
                ],
              ),
              FadeInRightBig(
                delay: Duration(milliseconds: 800),
                child: IconButton(
                    onPressed: () {
                      // Get.to(const UserProfileView());
                    },
                    icon: Image.asset("assets/img/avatar.png") as Widget),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
