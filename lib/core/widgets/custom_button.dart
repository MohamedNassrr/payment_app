import 'package:flutter/material.dart';
import 'package:payments_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title});

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 73,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff34A853),
      ),
      child: TextButton(
        onPressed: onPressed,
        child:  Text(
          title,
          style: Styles.style22,
        ),
      ),
    );
  }
}
