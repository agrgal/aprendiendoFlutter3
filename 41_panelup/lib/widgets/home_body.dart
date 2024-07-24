import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<String> persons =[
    "Luis", "Alfonso", "Patricia", "Maldonado", "Cubiertas",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(persons[index]),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
          leading: CircleAvatar(
            child: Text(persons[index].substring(0,1))
            ),
          );
        },
      ),

    );
  }
}