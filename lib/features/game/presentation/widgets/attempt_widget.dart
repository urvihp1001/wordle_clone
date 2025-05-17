import 'package:flutter/material.dart';

class AttemptWidget extends StatelessWidget {
  const AttemptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) {
              return const SizedBox(height: 10,);},
              separatorBuilder: (context, index) {
              return const SizedBox(height: 10,);}, itemCount: 5);
              
  }
}