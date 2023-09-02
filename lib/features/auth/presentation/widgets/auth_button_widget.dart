import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const AuthButtonWidget({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 48,
        child: TextButton(
            onPressed: () => onPressed,
            style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                textStyle: const TextStyle(color: Colors.black),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Colors.grey)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                alignment: Alignment.center),
            child: child),
      );
}
