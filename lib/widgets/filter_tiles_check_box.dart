import 'package:flutter/material.dart';

class FilterTilesCheckBox extends StatelessWidget {
  const FilterTilesCheckBox({
    super.key,
    required this.text,
    required this.isChecked,
    this.onChecked,
  });

  final String text;
  final bool isChecked;
  final void Function(bool?)? onChecked;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        Checkbox(
          value: isChecked,
          onChanged: onChecked,
        ),
      ],
    );
  }
}
