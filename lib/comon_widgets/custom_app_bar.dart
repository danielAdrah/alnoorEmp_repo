import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import 'package:get_storage/get_storage.dart';
import '../notification_/views/notification.dart';
import '../theme.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final GetStorage storage = GetStorage();

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
                    "${storage.read("userName")}",
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
