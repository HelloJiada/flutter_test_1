import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final double? bottonWidth;
  final VoidCallback onPressed;
  final String text;
  const CustomElevatedButton({super.key, this.bottonWidth, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 42,
        width: MediaQuery.of(context).size.width-200,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
        ),
    );
  }
}
