import 'package:flutter/material.dart';

import '../theme.dart';

class SecondaryButton extends StatelessWidget {
  String text;
  void Function()? onTap;
  SecondaryButton({super.key, required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          decoration: BoxDecoration(
              color: TColor.primary, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: TColor.white,
                  ),
                ),
                const SizedBox(width: 5),
                Icon(
                  Icons.check,
                  color: TColor.white,
                ),
              ],
            ),
          ),
        ));
  }
}
