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
      home: RegistroPage(),
    );
  }
}

class RegistroPage extends StatefulWidget {
  //Contiene un estado interno
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPage();
}

class _RegistroPage extends State<RegistroPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmarPasswordController = TextEditingController();

  void registroUsuario() {
    if (_formkey.currentState!.validate()) {
      String nombre = nombreController.text;
      String email = emailController.text;

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Registro Exitoso!',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 60),
              const SizedBox(height: 15),
              Text("Bienvenido, $nombre", style: TextStyle(fontSize: 16)),
              Text("Correo: $email", style: TextStyle(color: Colors.grey)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cerrar', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro de usuarios',
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
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(
                  labelText: "Nombre completo",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa tu nombre";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Correo electrónico",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa tu correo";
                  }

                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Correo invalido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: telefonoController,
                decoration: const InputDecoration(
                  labelText: "Telefono",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa tu telefono";
                  }

                  if (value.length < 10) {
                    return "Numero invalido (Demasiado corto)";
                  }

                  if (value.length > 15) {
                    return "Numero invalido (Demasiado largo)";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa tu telefono";
                  }

                  if (value.length < 6) {
                    return "Debe tener al menos 6 caracteres";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: confirmarPasswordController,
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa tu telefono";
                  }

                  if (value.length < 6) {
                    return "Debe tener al menos 6 caracteres";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: registroUsuario,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Registrar',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
