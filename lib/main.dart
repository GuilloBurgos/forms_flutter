import 'package:flutter/material.dart';

void main() {
  runApp(const RegistroApp());
}

// class TextoApp extends StatelessWidget {
//   //Sin estado interno
//   const TextoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TextoPage(),
//     );
//   }
// }

// class TextoPage extends StatefulWidget {
//   //Contiene un estado interno
//   const TextoPage({super.key});

//   @override
//   State<TextoPage> createState() => _TextoPageState();
// }

// class _TextoPageState extends State<TextoPage> {
//   String texto = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Texto duplicado',
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.bold,
//             color: Colors.brown,
//           ),
//         ),
//         backgroundColor: Colors.lightGreenAccent,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               onChanged: (valor) {
//                 setState(() {
//                   texto = valor;
//                 });
//               },
//               decoration: const InputDecoration(labelText: 'Escribe algo'),
//             ),
//             const SizedBox(height: 15),
//             Text('Texto ingresado: $texto'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Form extends StatelessWidget {
//   //Sin estado interno
//   const Form({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FormPage(),
//     );
//   }
// }

// class FormPage extends StatefulWidget {
//   //Contiene un estado interno
//   const FormPage({super.key});

//   @override
//   State<FormPage> createState() => _FormPageState();
// }

// class _FormPageState extends State<FormPage> {
//   final TextEditingController nombreController = TextEditingController();

//   void mostrarMensaje() {
//     String nombre = nombreController.text;
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text('Hola: $nombre')));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Formulario simple',
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.bold,
//             color: Colors.brown,
//           ),
//         ),
//         backgroundColor: Colors.lightGreenAccent,
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: nombreController,
//               decoration: const InputDecoration(
//                 labelText: "Escribe tu nombre",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 15),
//             ElevatedButton(
//               onPressed: mostrarMensaje,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Enviar'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RegistroApp extends StatelessWidget {
  //Sin estado interno
  const RegistroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  //Contiene un estado interno
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nombreController = TextEditingController();

  void mostrarMensaje() {
    String nombre = nombreController.text;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Hola: $nombre')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulario simple',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        backgroundColor: Colors.lightGreenAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: "Escribe tu nombre",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: mostrarMensaje,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
