import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wordle_urvi_version/core/theme/app_colors.dart';

class Lossdialog extends StatelessWidget {
  final String word;
  const Lossdialog({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),  
      backgroundColor: AppColors.red,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.sentiment_very_dissatisfied_rounded,
              size: 60, color: Theme.of(context).colorScheme.surface),
              SizedBox(height: 20,),
          Text(
            'You Lose!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 10,),
          Text(
            'The correct answer: $word!',
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
                      color: AppColors.red,
                      fontSize: 16,
                    )),
          ),
      ],),
    );
  }
}