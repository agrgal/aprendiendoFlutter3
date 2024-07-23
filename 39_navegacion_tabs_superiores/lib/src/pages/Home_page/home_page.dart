import 'package:flutter/material.dart';
import 'package:navegacion_tabs_superiores/src/pages/Home_page/tabs/bike.dart';
import 'package:navegacion_tabs_superiores/src/pages/Home_page/tabs/car.dart';
import 'package:navegacion_tabs_superiores/src/pages/Home_page/tabs/ship.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF105B52),
          title: const Text('Tab application'),
          bottom: const TabBar(
            tabs: [
                Tab(icon: Icon(Icons.directions_bike, color: Colors.white,)),
                Tab(icon: Icon(Icons.directions_boat, color: Colors.white,)),
                Tab(icon: Icon(Icons.directions_car, color: Colors.white)),                
            ],)
        ),
        body: const TabBarView(
          children: [
            BikeW(),
            ShipW(),
            CarW(),
          ]
        ),
      ),
    );
  }
}