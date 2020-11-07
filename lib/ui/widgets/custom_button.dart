import 'package:flutter/material.dart';
import 'package:weather_app/utils/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    @required this.title,
    this.onPressed,
    this.width = 150.0,
    this.height = 50.0,
    this.elevation = 4.0,
    this.borderRadius = 24.0,
    this.color = AppColors.primaryColor,
    this.borderSide = const BorderSide(
      width: 1.0,
      style: BorderStyle.solid,
      color: AppColors.primaryColor,
    ),
    this.textStyle,
  });

  final VoidCallback onPressed;
  final double width;
  final double height;
  final double elevation;
  final double borderRadius;
  final String title;
  final Color color;
  final BorderSide borderSide;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:16.0),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: elevation,
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: borderSide,
        ),
        height: height,
        color: color,
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }
}
