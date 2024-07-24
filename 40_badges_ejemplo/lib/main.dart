import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool _isLabelVisible = true;
  bool _isEmojiVisible = false;

  @override
  Widget build(BuildContext context) {       
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Badges'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState((){
                       _isLabelVisible = ! _isLabelVisible;
                       // _isLabelVisible = _isLabelVisible ^true;
                       print(_isLabelVisible);
                  });
                },
              child: const Text("Mostrar u Ocultar")),
              InkWell(
                onLongPress: (){
                    setState(() {
                      _isEmojiVisible = !_isEmojiVisible;
                    });
                },
                child: Badge(        
                  offset: const Offset(30, -30), 
                  backgroundColor: Colors.transparent,         
                  isLabelVisible: _isEmojiVisible,
                  smallSize: 30.0,
                  largeSize: 60.0,
                  label: const Text("🙂", style: TextStyle(fontSize: 30.0,)), //:smile 
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.7,
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    color: Colors.cyan,
                    child: const Text(                
                      textAlign: TextAlign.center,
                      "Este es un mensaje que me enviaron a través de un chat",
                      style: TextStyle(color: Colors.white,)
                    ),
                  ),
                ),
              ),

            ],

          )    
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Badge(label: Text('5'), child: Icon(Icons.home)),
              label: "Casa"
            ),
            BottomNavigationBarItem(
              icon: Badge(
                isLabelVisible: _isLabelVisible,
                label: const Text("10"),
                backgroundColor: const Color.fromARGB(255, 235, 194, 43),
                child: const Icon(Icons.car_rental)
              ), 
              label: "Coche"
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.stairs_rounded), 
              label: "Escaleras"
            ),
          ],
          ),
      ),
    );
  }
}