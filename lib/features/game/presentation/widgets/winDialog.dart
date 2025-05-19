import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wordle_urvi_version/core/theme/app_colors.dart';

class Windialog extends StatelessWidget {
  final String word;
  const Windialog({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),  
      backgroundColor: AppColors.green,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.sentiment_very_satisfied_rounded,
              size: 60, color: Theme.of(context).colorScheme.surface),
              SizedBox(height: 20,),
          Text(
            'You Win!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 10,),
          Text(
            'Congratulations! You guessed the word: $word!',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.surface,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              context.pop();//close the dialog
              context.pop();//go to home page
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('HOME',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.green,
                      fontSize: 16,
                    )),
          ),
      ],),
    );
  }
}