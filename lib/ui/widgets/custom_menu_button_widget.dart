import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/app_texts.dart';

class CustomMenuButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomMenuButtonWidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: ElevatedButton(
              onPressed: onPressed,
              child: Text(title, style: AppText.buttontitle,),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary
              )
            ),
    );
  }
}