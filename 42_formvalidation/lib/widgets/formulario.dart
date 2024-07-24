import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  // Variable creada de tipo GlobalKey asociada al estado de un formulario
  final GlobalKey<FormState> _formularioEstado = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.yellow[50],
      ),
      child: Form(
        key: _formularioEstado, // asocio la variable a este formulario. 
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextFormField(
                validator: (value){
                  // si retorna algo nulo es que salió bien, y si una cadena es que salió mal. 
                  if (!value!.contains("@")) { // si el valor NO contiene una arroba
                      return "Correo no válido";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "correo electrónico",
                  border: InputBorder.none,
                  fillColor: Colors.amber,
                  filled: true,
                ),
              )
            ),
           Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextFormField(
                obscureText: true,
                validator: (value){
                  // si retorna algo nulo es que salió bien, y si una cadena es que salió mal. 
                  if (value!.length<8) { // si el valor NO contiene una arroba
                      return "Contraseña muy corta";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "password",
                  border: InputBorder.none,
                  fillColor: Colors.amber,
                  filled: true,
                ),
              )
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                    if(_formularioEstado.currentState!.validate()){
                        // realizamos el resto del proceso
                        print("Éxito");
                    } else {
                        print("Hay errores");
                    }
                },
                child: const Text("Enviar"),)
            )
          ],
        ),
      )
    );
  }
}