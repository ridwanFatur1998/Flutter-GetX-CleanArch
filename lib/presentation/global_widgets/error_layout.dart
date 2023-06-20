import 'package:flutter/material.dart';

class ErrorLayout extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;

  const ErrorLayout({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          elevation: 10,
          color: Colors.green,
          child: InkWell(
            onTap: () {
              onPressed();
            },
            splashFactory: InkRipple.splashFactory,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              child: Text(
                "Try Again",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
