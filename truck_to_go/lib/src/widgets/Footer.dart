import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function() onMapPressed;
  final Function() onListPressed;

  Footer({required this.onMapPressed, required this.onListPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: onMapPressed,
            child: Text('Map View'),
          ),
          ElevatedButton(
            onPressed: onListPressed,
            child: Text('List View'),
          ),
        ],
      ),
    );
  }
}
