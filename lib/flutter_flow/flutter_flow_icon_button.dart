import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  const FlutterFlowIconButton({
    super.key,
    required this.icon,
    this.borderColor = Colors.transparent,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.buttonSize = 40.0,
    this.fillColor,
    this.disabledColor,
    this.disabledIconColor,
    this.hoverColor,
    this.hoverIconColor,
    this.iconColor,
    this.iconSize = 24.0,
    this.onPressed,
    this.showLoadingIndicator = false,
  });

  final Widget icon;
  final double borderRadius;
  final double buttonSize;
  final Color borderColor;
  final double borderWidth;
  final Color? fillColor;
  final Color? disabledColor;
  final Color? disabledIconColor;
  final Color? hoverColor;
  final Color? hoverIconColor;
  final Color? iconColor;
  final double iconSize;
  final Function()? onPressed;
  final bool showLoadingIndicator;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Ink(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: fillColor ?? Colors.transparent,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
          iconSize: iconSize,
          color: iconColor,
          splashRadius: buttonSize / 2,
        ),
      ),
    );
  }
}