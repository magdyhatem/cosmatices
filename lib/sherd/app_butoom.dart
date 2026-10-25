import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final bool? isLoading;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    this.isLoading,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton(
          onPressed: (isLoading ?? false) ? null : onPressed,
          child: (isLoading ?? false)
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
        ),
      ],
    );
  }
}