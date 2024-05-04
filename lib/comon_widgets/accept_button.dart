import 'package:flutter/material.dart';

import '../theme.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          decoration: BoxDecoration(
              color: TColor.primary, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Text(
                "قبول",
                style: TextStyle(color: TColor.white),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.check,
                color: TColor.white,
              ),
            ],
          ),
        ));
  }
}
