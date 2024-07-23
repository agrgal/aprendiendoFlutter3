import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage almacen = FirebaseStorage.instance;

Future<bool> subirImagen( File imagen) async {
  print(imagen.path);

  final String nombreFichero = imagen.path.split("/").last; 

  Reference refUpload = almacen.ref().child("misImagenes").child(nombreFichero);

  final UploadTask uploadTask = refUpload.putFile(imagen);

  print(UploadTask);

  final TaskSnapshot snapshot = await uploadTask.whenComplete(()=>true);

  print(snapshot);

  final String url = await snapshot.ref.getDownloadURL();

  print(url);

  if (snapshot.state == TaskState.success) {
    return true;
  } else {
    return false;
  }
}
