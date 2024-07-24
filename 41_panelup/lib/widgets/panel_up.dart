import 'package:flutter/material.dart';

class PanelUp extends StatelessWidget {
  const PanelUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Column(
        children:[
          const Icon(Icons.drag_handle_rounded),
          Image.asset("assets/images/map.jpg"),
        ],
      ),
    );
  }
}