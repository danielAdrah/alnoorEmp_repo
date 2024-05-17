import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import 'package:elnoor_emp/core/api/dio_consumer.dart';

import 'package:get/get.dart';

import '../conversation/views/Conversation.dart';
import '../employee_tasks/controller/tasks_controller.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key});

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  final TasksController controller =
      Get.put(TasksController(api: DioConsumer(dio: Dio())));
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(
        init: TasksController(api: DioConsumer(dio: Dio())),
        builder: (context) {
          return ZoomIn(
            delay: const Duration(milliseconds: 800),
            child: InkWell(
              onTap: () {
                // Get.to(Conversation());
                controller.switchToAcceptedTask();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Image.asset("assets/img/center_navBar.png"),
              ),
            ),
          );
        });
  }
}
