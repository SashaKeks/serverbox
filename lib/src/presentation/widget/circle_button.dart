import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData pIcon;
  final Color? pBgColor;
  final Color? pForegroundColor;
  final Color? pColor;
  final double? pSize;
  void Function()? onTap;
  CircleButton({
    super.key,
    required this.pIcon,
    required this.onTap,
    this.pBgColor,
    this.pForegroundColor,
    this.pColor,
    this.pSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        backgroundColor: pBgColor ?? Colors.amber[800],
        foregroundColor: pForegroundColor ?? Colors.black,
      ),
      child: Icon(
        pIcon,
        color: pColor ?? Colors.black,
        size: pSize ?? 35,
      ),
    );
  }
}
