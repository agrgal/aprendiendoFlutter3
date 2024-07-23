import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uploads_firebase/services/select_image.dart';
import 'package:uploads_firebase/services/upload_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  File? miImagenASubir; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicación Imágenes'),
      ),
      body: Column(
        children: [
          miImagenASubir!=null 
          ? SizedBox(
            width: double.infinity,
            height: 400.0,          
            child: Image.file(
              miImagenASubir!, 
              fit: BoxFit.contain,
              ),
          ) 
          : Container (
            width: double.infinity,
            height: 200.0,
            margin: const EdgeInsets.all(10),
            color: Colors.red,
          ),
          ElevatedButton(
            onPressed: () async {
              final XFile? imagen = await getImage(); // Selecciona una imagen 
              setState(() {
                   if (imagen?.path != null ) {
                      miImagenASubir = File(imagen!.path);
                   }                   
              });
            }, 
            child: const Text("Seleccionar imagen")),
           ElevatedButton(
            onPressed: () async {
              if (miImagenASubir==null) { return; }
              final uploaded = await subirImagen(miImagenASubir!);

              if (uploaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Imagen subida correctamente"))
                  );
              } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Error al subir la imagen"))
                  );
              }
            }, 
            child: const Text("Subir imagen a Firebase")),
        ],
        )
    );
  }
}