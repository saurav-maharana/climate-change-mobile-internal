import 'package:flutter/material.dart';

class OpenWeatherToggleButton extends StatefulWidget {
  final String toggleButtonText1;
  final String toggleButtonText2;

  const OpenWeatherToggleButton({
    Key? key,
    required this.toggleButtonText1,
    required this.toggleButtonText2,
  }) : super(key: key);

  @override
  State<OpenWeatherToggleButton> createState() =>
      _OpenWeatherToggleButtonState();
}

class _OpenWeatherToggleButtonState extends State<OpenWeatherToggleButton> {
  final List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: Colors.black,
      fillColor: Colors.white,
      borderRadius: BorderRadius.circular(30.0),
      onPressed: (int index) {
        for (int i = 0; i < isSelected.length; i++) {
          setState(() {
            if (i == index) {
              isSelected[i] = true;
            } else {
              isSelected[i] = false;
            }
          });
        }
      },
      isSelected: isSelected,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(widget.toggleButtonText1),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(widget.toggleButtonText2),
        ),
      ],
    );
  }
}
