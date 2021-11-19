import 'package:appd/theme/app_colors.dart';
import 'package:appd/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      color: AppColors.darkGreen,
      child: Text(
        text,
        style: AppTextStyles.whiteS4W4,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
