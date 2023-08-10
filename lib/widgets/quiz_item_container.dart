import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';

class QuizItemContainer extends StatelessWidget {
  const QuizItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          border: Border.all(color: ThemeColor.grey_300),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Statistics Math Quiz",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.black)),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Math - 12 Questions",
                      style: TextStyle(fontSize: 12, color: ThemeColor.grey))
                ],
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: ThemeColor.primaryDark,
            size: 16,
          )
        ],
      ),
    );
  }
}
