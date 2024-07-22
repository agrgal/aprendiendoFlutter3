import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {

  final String url;

  const ImagePage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (){
                   Navigator.pop(context);
                }, 
                icon: const Icon(Icons.arrow_back_ios_sharp, color: Color.fromARGB(255, 202, 186, 138)),
              ),
              Hero(tag: url, child: Image.network(url)),
              const Divider(),
            ],
          )
        ),
      ),
    );
  }
}