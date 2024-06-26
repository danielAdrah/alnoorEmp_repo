// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:elnoor_emp/comon_widgets/primary_button.dart';
import 'package:elnoor_emp/core/api/dio_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../comon_widgets/secondary_button.dart';
import '../../../comon_widgets/reject_button.dart';
import '../../../theme.dart';
import '../../controller/tasks_controller.dart';

class InPlaceTask extends StatefulWidget {
  const InPlaceTask({super.key});

  @override
  State<InPlaceTask> createState() => _InPlaceTaskState();
}

// we will get the main text and the sub text and the date from the api and display them(api for in_place task)
class _InPlaceTaskState extends State<InPlaceTask> {
  final TasksController controller =
      Get.put(TasksController(api: DioConsumer(dio: Dio())));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchInPlaceTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: TColor.primary,
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var media = MediaQuery.of(context).size;
                var data = snapshot.data![index];
                return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: media.height * 0.01,
                      horizontal: media.width * 0.03),
                  padding: EdgeInsets.all(media.width * 0.03),
                  decoration: BoxDecoration(
                      border: Border.all(color: TColor.black.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              data.title,
                              style: TextStyle(
                                  color: TColor.black,
                                  fontSize: media.width * 0.04,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${data.content}",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: TColor.black.withOpacity(0.4),
                                fontSize: media.width * 0.03,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              "${data.created}".toString().substring(0, 11),
                              style:
                                  TextStyle(color: TColor.primary, fontSize: 9),
                            ),
                            Text(
                              "${data.created}".toString().substring(11, 16),
                              style:
                                  TextStyle(color: TColor.primary, fontSize: 9),
                            ),
                            SizedBox(height: media.width * 0.02),
                            SecondaryButton(
                                text: "قبول",
                                onTap: () async {
                                  return controller.switchToAcceptedTask();
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Image(
                          image: AssetImage("assets/img/notification_icon.png"))
                    ],
                  ),
                );
              });
        }
      },
    );
  }
}
