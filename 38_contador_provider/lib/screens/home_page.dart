import 'package:contador_provider/pages/page_1.dart';
import 'package:contador_provider/pages/page_2.dart';
import 'package:contador_provider/pages/page_3.dart';
import 'package:contador_provider/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedindex = 0;

  final List<Widget> _pages = <Widget> [
      const Page1(),
      const Page2(),
      const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Provider'),
        actions: [
          TextButton(onPressed: (){}, child: 
          Text(context.watch<CounterProvider>().counter.toString())
          )
        ],
      ),
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            _selectedindex = index;
          });
        },
        currentIndex: _selectedindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Page 1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "Page 2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "Page 3",
          ),
      ],),
    );
  }
}