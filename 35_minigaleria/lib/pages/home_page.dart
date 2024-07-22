import 'package:flutter/material.dart';
import 'package:minigaleria/data/images_data.dart';
import 'package:minigaleria/pages/images_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nuestra galería",
          style: TextStyle(color: Color.fromARGB(255, 237, 214, 96)),
        ),
        backgroundColor: Colors.black,
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 150.0, // ancho máximo
        padding: const EdgeInsets.all(5.0), // separación del vorde del  gridview alrededor
        mainAxisSpacing: 5.0, // separación entre filas de elementos
        crossAxisSpacing: 5.0, // en cada fila una separación de 5
        children:_imagesList, 
      )
    );
  }

  // Método extraído de children 
  List<Widget> get _imagesList {

    List<Widget> listImages = [];
    
    for (var cadaImagen in images) {
        listImages.add(
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePage(url: cadaImagen)));
            },
            child: Hero(
              tag: cadaImagen,
              child: Image.network(
                cadaImagen, 
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 140,);
                },
                ),
            ),
          ));
    }

    return listImages;
  }
}

