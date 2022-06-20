import 'package:flutter/material.dart';

class OpenWeatherToggleButton extends StatelessWidget {
  final List<bool> isSelected;
  final String toggleButtonText1;
  final String toggleButtonText2;

  const OpenWeatherToggleButton({
    Key? key,
    required this.isSelected,
    required this.toggleButtonText1,
    required this.toggleButtonText2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: Colors.black,
      fillColor: Colors.white,
      borderRadius: BorderRadius.circular(30.0),
      onPressed: (int index) {
        for (int i = 0; i < isSelected.length; i++) {
          if (i == index) {
            isSelected[i] = !isSelected[i];
          } else {
            isSelected[i] = false;
          }
        }
      },
      isSelected: isSelected,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(toggleButtonText1),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(toggleButtonText2),
        ),
      ],
    );
  }
}
