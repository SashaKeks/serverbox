import 'package:flutter/material.dart';

class SquareButton extends StatelessWidget {
  final IconData pIcon;
  final Color? pBgColor;
  final Color? pForegroundColor;
  final Color? pColor;
  final double? pSize;
  final double? width;
  final double? height;
  void Function()? onTap;
  SquareButton({
    super.key,
    required this.pIcon,
    required this.onTap,
    this.pBgColor,
    this.pForegroundColor,
    this.pColor,
    this.pSize,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 100, height ?? 100),
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
