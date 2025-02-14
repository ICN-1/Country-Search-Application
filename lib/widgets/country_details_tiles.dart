import 'package:flutter/material.dart';

class CountryDetailsTiles extends StatelessWidget {
  const CountryDetailsTiles({
    super.key,
    required this.label,
    required this.detail,
  });

  final String label, detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          softWrap: true,
        ),
        const SizedBox(width: 8.0),
        Text(
          detail,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
          softWrap: true,
        ),
      ],
    );
  }
}
