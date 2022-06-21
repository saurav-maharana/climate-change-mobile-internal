import 'package:flutter/material.dart';

class ForecastScrollStrcutre extends StatelessWidget {
  final String dayOfWeek;
  final String temperatureOnThatDay;

  const ForecastScrollStrcutre({
    Key? key,
    required this.dayOfWeek,
    required this.temperatureOnThatDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalDivider(
          thickness: 2,
          color: Colors.black,
        ),
        Text(
          dayOfWeek,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        Text(
          temperatureOnThatDay,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
