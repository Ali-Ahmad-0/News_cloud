import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonContent;
  final Color color;
  final Color textColor;
  final IconData? icon;
  final double borderRadius;
  VoidCallback onTap;

   CustomButton({
    super.key,

    required this.onTap,
    required this.buttonContent,
    this.color = Colors.indigo,
    this.textColor = Colors.white,
    this.icon,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.8)], // Smooth gradient effect
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor),
              const SizedBox(width: 8),
            ],
            Text(
              buttonContent,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
