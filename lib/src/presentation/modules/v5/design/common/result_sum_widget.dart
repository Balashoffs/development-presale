import 'package:flutter/material.dart';

class TextCustomWidget extends StatelessWidget {
  const TextCustomWidget({super.key, required this.name, required this.value});

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, textAlign: TextAlign.center, style: TextStyle()),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class RowTextWidgets extends StatelessWidget {
  const RowTextWidgets({super.key, required this.values});

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 24.0),
      child: Center(
        child: Row(
          spacing: 32.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(values.length, (index) {
            return Text(
              values[index],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            );
          }),
        ),
      ),
    );
  }
}
