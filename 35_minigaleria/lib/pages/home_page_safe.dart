import 'package:flutter/material.dart';
import 'package:minigaleria/data/images_data.dart';
import 'package:minigaleria/pages/images_page.dart';
import 'package:http/http.dart' as http;

class HomePageSafe extends StatefulWidget {
  const HomePageSafe({super.key});

  @override
  State<HomePageSafe> createState() => _HomePageSafeState();
}

class _HomePageSafeState extends State<HomePageSafe> {
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
      body: FutureBuilder(
        future: _imagesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.extent (
              maxCrossAxisExtent: 150.0, // ancho máximo
              padding: const EdgeInsets.all(5.0), // separación del vorde del  gridview alrededor
              mainAxisSpacing: 5.0, // separación entre filas de elementos
              crossAxisSpacing: 5.0, // en cada fila una separación de 5
              children: snapshot.data ?? [], 
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      )
    );
  }

  // Método extraído de children 
  Future<List<Widget>>  get _imagesList async {

    List<Widget> listImages = [];
    
    for (var cadaImagen in images) {
        
        if (await existe(cadaImagen)) {        
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
            )
            ); // Fin de list add

          } // fin del if
    }

    return listImages;
  }
}


// Métodos, funciones
Future<bool> existe(String uri) async {
    try {
      final response = await http.head(Uri.parse(uri));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
}

