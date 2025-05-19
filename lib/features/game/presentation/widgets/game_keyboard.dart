import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_urvi_version/core/theme/app_colors.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_bloc.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_state.dart';

class GameKeyboard extends StatelessWidget {
  final Function (String)? onKeyPressed;
  final Function ()? onDelete;
  final Function ()? onSubmit;

  const GameKeyboard({super.key, required this.onKeyPressed, required this.onDelete,required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    const rows=['QWERTYUIOP','ASDFGHJKL','ZXCVBNM'];
    return BlocBuilder<GameBloc,GameState>(builder:( context,state){
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(mainAxisSize:MainAxisSize.min,
        children: [
          ...rows.map((row)=>
         _buildKeyboardRow(context, state, row),
         //for every row in rows, build a row of keys
         ),SizedBox(height: 10,),
          _buildActionRow(state),
          
        ],
        ),
      );
    });

  }
  Widget _buildKeyboardRow(BuildContext context, GameState state, String row){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: row.split('').map((key)=>_buildKey(context, state, key)).toList(),//extract each letter in row while iterating thru every row so 3 build rows maybe reqd
    );
  }
  Widget _buildActionRow(GameState state){
    return Row(
      children: [
        Expanded(child: AspectRatio(
          aspectRatio: 3,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: ElevatedButton(
              onPressed: onDelete,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child:Icon(
                CupertinoIcons.delete_left,
                color: Colors.white,
              ),
            ),
          ),
        )),
      ],
    );
  }
  Widget _buildKey(BuildContext context, GameState state, String key){
    return Expanded(
      
    child: AspectRatio(
      aspectRatio: 0.8,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: ElevatedButton(onPressed: ()=>onKeyPressed!(key),
        style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        
        ),
        ),
        child: Text(
          key,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    )
    )
    );
  }
}