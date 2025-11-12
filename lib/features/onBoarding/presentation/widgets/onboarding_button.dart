
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {


  final bool visible;
  final IconData icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;


  const OnboardingButton({super.key, required this.visible, required this.icon, required this.onPressed, required this.backgroundColor, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        return FadeTransition(
            opacity: animation,
          child: child,
        );
      },
      child: visible ? Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1)
        ),
        child: FloatingActionButton(
            onPressed: onPressed,
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: const CircleBorder(),
          child: Icon(
              icon,
          color: iconColor,
          ),
        ),
      ): SizedBox(),
    );
  }
}
