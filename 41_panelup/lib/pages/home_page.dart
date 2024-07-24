import 'package:flutter/material.dart';
import 'package:panelup/widgets/home_body.dart';
import 'package:panelup/widgets/panel_up.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Deslizable'),
        backgroundColor: Colors.yellow[50],
      ),
      body: SlidingUpPanel(
        color: Colors.transparent,
        minHeight: 30,
        maxHeight: MediaQuery.of(context).size.height*0.8,
        panel: const PanelUp(),
        body: HomeBody(),
        ),
    );
  }
}