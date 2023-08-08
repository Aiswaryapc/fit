import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final double width;
  final VoidCallback onClicked;

  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      this.color = Colors.white,
      this.backgroundColor = Colors.black,
      this.width = 250})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        width: width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
            onPressed: onClicked,
            child: Text(
              text,
              style: TextStyle(fontSize: 20, color: color),
            )),
      );
}
