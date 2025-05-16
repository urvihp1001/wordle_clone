import 'package:flutter/widgets.dart';

class SliderSelect extends StatelessWidget {
  const SliderSelect({super.key, required this.title, required this.onChanged, required this.value, required this.min, required this.max});
  final String title;
  final ValueChanged<double> onChanged;
  final double value;
  final double min;
  final double max;
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}