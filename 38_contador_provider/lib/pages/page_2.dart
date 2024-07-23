import 'package:contador_provider/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          Text(
            context.watch<CounterProvider>().counter.toString(), 
            style: const TextStyle(fontSize: 50.0,)
          ),
          ElevatedButton(
            onPressed: (){
              // setState(() { // cambio el estado.
                // _counter++;
                context.read<CounterProvider>().decrement();
              // });
            }, 
            child: const Text("Restar"),
          )],
      ),
    );
  }
}