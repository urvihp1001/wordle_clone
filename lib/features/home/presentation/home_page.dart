import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String route='/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Wordle Clone',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              letterSpacing: 2,
              color: Theme.of(context).colorScheme.primary
            ),
            ),
            SizedBox(height: 10,),
            Text('By Urvi Patel',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              letterSpacing: 2,
              fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(height: 16,),
            Text("Choose your game settings",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 20,
             
            ),),
            SizedBox(height: 16,),
            Text("Word Length",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 20,
            ),),
            Slider(
              value: 5,
              min: 1,
              max: 10,
              divisions: 9,
              onChanged: (value) {},
            ),
          ],
        ),
      ),)
    );
  }
}