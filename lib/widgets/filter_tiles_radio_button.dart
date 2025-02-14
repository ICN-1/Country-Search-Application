import 'package:flutter/material.dart';

class FilterTilesRadioButton extends StatelessWidget {
  const FilterTilesRadioButton({
    super.key,
    required this.text,
    required this.value,
    required this.selectedValue,
    this.onChanged,
  });

  final String text, value, selectedValue;
  final void Function(String?)? onChanged;

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
        Radio<String>(
          value: value,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
