import 'package:flutter/material.dart';

class LetterBoxWidget extends StatelessWidget {
  final Color? boxColor;
  final Color? textColor;
  final String? text;
  LetterBoxWidget({super.key, this.boxColor, this.textColor, this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    margin: EdgeInsets.symmetric(horizontal: 3),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
    
      borderRadius: BorderRadius.circular(8),
      color: boxColor ?? Theme.of(context).colorScheme.primary,
    ),
    child: Center(
      child: Text(
        text??'',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: textColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    );
  }
}