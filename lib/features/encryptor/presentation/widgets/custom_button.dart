import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onPressed, required this.backgroundColor});
  final String title;
  final void Function()? onPressed;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
