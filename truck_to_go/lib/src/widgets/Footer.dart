import 'package:flutter/material.dart';

enum CurrentView { mapView, listView }

class Footer extends StatelessWidget {
  final Function() onMapPressed;
  final Function() onListPressed;
  final CurrentView currentView;

  const Footer({
    Key? key,
    required this.onMapPressed,
    required this.onListPressed,
    required this.currentView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            //If currentView is mapView, the button is disabled and grayed out
            onPressed: currentView == CurrentView.mapView ? null : onMapPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: currentView == CurrentView.mapView ? Colors.grey : null,
            ),
            child: const Text('Map View'),
          ),
          ElevatedButton(
            //If currentView is listView, the button is disabled and grayed out
            onPressed: currentView == CurrentView.listView ? null : onListPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: currentView == CurrentView.listView ? Colors.grey : null,
            ),
            child: const Text('List View'),
          ),
        ],
      ),
    );
  }
}
