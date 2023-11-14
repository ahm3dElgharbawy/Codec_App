import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(minimumSize: Size(double.infinity, 0)),
      child: SizedBox(
        height: 90,
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
