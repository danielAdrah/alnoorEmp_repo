import 'package:flutter/material.dart';

import '../theme.dart';

class RejectButton extends StatelessWidget {
  const RejectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
              color: TColor.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          child: const Row(
            children: [
              Text(
                "رفض",
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.close,
                color: Colors.red,
              ),
            ],
          ),
        ));
  }
}
