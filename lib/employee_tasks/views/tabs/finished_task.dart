import 'package:flutter/material.dart';

import '../../../comon_widgets/accept_button.dart';
import '../../../comon_widgets/reject_button.dart';
import '../../../theme.dart';

class FinishedTask extends StatefulWidget {
  const FinishedTask({super.key});

  @override
  State<FinishedTask> createState() => _FinishedTaskState();
}
// we will get the main text and the sub text and the date from the api and display them(api for finished task)

class _FinishedTaskState extends State<FinishedTask> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: TColor.black.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "main text",
                      style: TextStyle(
                          color: TColor.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "sub text",
                      style: TextStyle(
                        color: TColor.black.withOpacity(0.4),
                        fontSize: 11,
                      ),
                    ),
                    const Text(
                      "date",
                      style: TextStyle(color: TColor.primary, fontSize: 9),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
                const SizedBox(width: 10),
                const Image(
                    image: AssetImage("assets/img/notification_icon.png"))
              ],
            ),
          );
        });
  }
}
