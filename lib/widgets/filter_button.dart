import 'package:country_search/utils/constants/app_colours.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderColor,
    this.onPress,
    this.text,
    this.textColor,
  });

  final String? text;
  final double? height, width;
  final Color? backgroundColor, borderColor, textColor;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height ?? 48.0,
        width: width ?? 200.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor ?? AppColours.white,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text ?? "Button",
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}
