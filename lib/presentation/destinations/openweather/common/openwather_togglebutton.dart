import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OpenWeatherToggleButton extends ConsumerStatefulWidget {
  final String toggleButtonText1;
  final String toggleButtonText2;
  final Function(int) onPressed;
  final List<bool> isSelected;

  const OpenWeatherToggleButton(
      {Key? key,
      required this.toggleButtonText1,
      required this.toggleButtonText2,
      required this.onPressed,
      required this.isSelected})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      OpenWeatherToggleButtonState();
}

class OpenWeatherToggleButtonState
    extends ConsumerState<OpenWeatherToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      selectedColor: Colors.black,
      fillColor: Colors.white,
      borderRadius: BorderRadius.circular(30.0),
      onPressed: widget.onPressed,
      isSelected: widget.isSelected,
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
