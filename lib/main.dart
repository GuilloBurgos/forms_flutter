// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';


// void main() {
//   runApp(const RegistroApp());
// }

// class RegistroApp extends StatelessWidget {
//   const RegistroApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: RegistroPage(),
//     );
//   }
// }

// class RegistroPage extends StatefulWidget {
//   const RegistroPage({super.key});
//   @override
//   State<RegistroPage> createState() => _RegistroPage();
// }

// class _RegistroPage extends State<RegistroPage> {
//   final _formkey = GlobalKey<FormState>();
//   final TextEditingController nombreController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController telefonoController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmarPasswordController =  TextEditingController();
//   bool _mostrarPassword = false;
//   bool _mostrarConfirmPassword = false;
//   File? _imagenSeleccionada;
//   String? _imagenSeleccionadaWeb;

//   Future<void> seleccionarImagen() async{
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
        
//  if (kIsWeb) {
//           _imagenSeleccionadaWeb = pickedFile.path; // blob URL para web
//         } else {
//           _imagenSeleccionada = File(pickedFile.path);
//         }

//       });
//     }
//   }


// void registroUsuario() async {
//   if (_formkey.currentState!.validate()) {
//     try {
//       var uri = Uri.parse("http://192.168.1.1:3000/api/usuarios");

//       var request = http.MultipartRequest('POST', uri);
//       request.fields['nombre'] = nombreController.text;
//       request.fields['email'] = emailController.text;
//       request.fields['telefono'] = telefonoController.text;
//       request.fields['password'] = passwordController.text;

//       // Adjuntar imagen si hay
//       if (_imagenSeleccionada != null && !kIsWeb) {
//         request.files.add(await http.MultipartFile.fromPath(
//           'imagen',
//           _imagenSeleccionada!.path,
//         ));
//       }

//       var response = await request.send();

//       if (response.statusCode == 200) {
//         final respStr = await response.stream.bytesToString();
//         final data = jsonDecode(respStr);

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(data["mensaje"])),
//         );

//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text("Registro Exitoso"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 if (data['usuario']['imagenUrl'] != null)
//                   Image.network(
//                     "http://192.168.1.1:3000${data['usuario']['imagenUrl']}",
//                     height: 100,
//                   ),
//                 Text("Usuario: ${data['usuario']['nombre']}"),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text("Cerrar"),
//               ),
//             ],
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error: ${response.statusCode}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error de conexión: $e")),
//       );
//     }
//   }
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Registro de usuarios',
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
//         child: Form(
//           key: _formkey,
//           child: ListView(
//             children: [
//               Center(
//                 child: GestureDetector(
//                   onTap: seleccionarImagen,
//                   child: CircleAvatar(
//                     radius: 50,                    
// backgroundImage: kIsWeb
//                         ? (_imagenSeleccionadaWeb != null ? NetworkImage(_imagenSeleccionadaWeb!) : null)
//                         : (_imagenSeleccionada != null ? FileImage(_imagenSeleccionada!) : null),                    
// child: (_imagenSeleccionada == null && _imagenSeleccionadaWeb == null)
//                         ? const Icon(Icons.person, size: 40, color: Colors.grey)
//                         : null,
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 controller: nombreController,
//                 decoration: InputDecoration(
//                   labelText: "Nombre completo",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Por favor ingresa tu nombre";
//                   }
//                   if (value.length < 3) {
//                     return "El nombre debe tener al menos 3 letras";
//                   }    
// if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+(?:\s[a-zA-ZáéíóúÁÉÍÓÚñÑ]+)*$').hasMatch(value)) {
//       return "Solo letras y espacios (sin espacios al inicio)";
//     }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: "Correo electrónico",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Por favor ingresa tu correo";
//                   }

//                   if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                     return "Correo invalido";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: telefonoController,
//                 decoration: const InputDecoration(
//                   labelText: "Telefono",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {return "Por favor ingresa tu telefono"; }

//                   if (value.length < 10) {return "Numero invalido (Demasiado corto)";}

//                   if (value.length > 15) {return "Numero invalido (Demasiado largo)"; }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   labelText: "Contraseña",
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _mostrarPassword
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _mostrarPassword = !_mostrarPassword;
//                       });
//                     },
//                   ),
//                 ),
//                 obscureText: !_mostrarPassword,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Por favor ingresa tu contraseña";
//                   }
//                   if (value.length < 6) {
//                     return "Debe tener al menos 6 caracteres";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: confirmarPasswordController,
//                 decoration: InputDecoration(
//                   labelText: "Confirmar contraseña",
//                   border: OutlineInputBorder(),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _mostrarConfirmPassword
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _mostrarConfirmPassword = !_mostrarConfirmPassword;
//                       });
//                     },
//                   ),
//                 ),
//                 obscureText: !_mostrarConfirmPassword,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Confirma tu contraseña";
//                   }

//                   if (value != passwordController.text) {
//                     return "Las contraseñas no coinciden";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               ElevatedButton(
//                 onPressed: registroUsuario,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                 ),
//                 child: Text(
//                   'Registrar',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

void main() => runApp(const RegistroApp());

class RegistroApp extends StatelessWidget {
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

  bool _mostrarPassword = false;
  bool _mostrarConfirmPassword = false;

  File? _imagenSeleccionada;
  Uint8List? _imagenBytes; // para Web

  // Método para seleccionar imagen
  Future<void> seleccionarImagen() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _imagenBytes = bytes;
        });
      } else {
        setState(() {
          _imagenSeleccionada = File(pickedFile.path);
        });
      }
    }
  }

  // Método para registrar usuario
  Future<void> registroUsuario() async {
    if (_formkey.currentState!.validate()) {
      try {
        var uri = Uri.parse("http://192.168.1.1:3000/api/usuarios");

        var request = http.MultipartRequest('POST', uri);
        request.fields['nombre'] = nombreController.text;
        request.fields['email'] = emailController.text;
        request.fields['telefono'] = telefonoController.text;
        request.fields['password'] = passwordController.text;

        // Adjuntar imagen (web o móvil)
        if (kIsWeb && _imagenBytes != null) {
          request.files.add(http.MultipartFile.fromBytes(
            'imagen',
            _imagenBytes!,
            filename: 'imagen.jpg',
            contentType: MediaType('image', 'jpeg'),
          ));
        } else if (!kIsWeb && _imagenSeleccionada != null) {
          request.files.add(await http.MultipartFile.fromPath(
            'imagen',
            _imagenSeleccionada!.path,
          ));
        }

        var response = await request.send();

        if (response.statusCode == 200) {
          final respStr = await response.stream.bytesToString();
          final data = jsonDecode(respStr);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data["mensaje"])),
          );

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Registro Exitoso"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (data['usuario']['imagenUrl'] != null)
                    Image.network(
                      "http://192.168.1.1:3000${data['usuario']['imagenUrl']}",
                      height: 100,
                    ),
                  Text("Usuario: ${data['usuario']['nombre']}"),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cerrar"),
                ),
              ],
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${response.statusCode}")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error de conexión: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              Center(
                child: GestureDetector(
                  onTap: seleccionarImagen,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: kIsWeb
                        ? (_imagenBytes != null ? MemoryImage(_imagenBytes!) : null)
                        : (_imagenSeleccionada != null ? FileImage(_imagenSeleccionada!) : null),
                    child: (_imagenSeleccionada == null && _imagenBytes == null)
                        ? const Icon(Icons.person, size: 40, color: Colors.grey)
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: "Nombre completo",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa tu nombre";
                  }
                  if (value.length < 3) {
                    return "El nombre debe tener al menos 3 letras";
                  }
                  if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$').hasMatch(value)) {
                    return "Solo letras y espacios";
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
                    return "Correo inválido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: telefonoController,
                decoration: const InputDecoration(
                  labelText: "Teléfono",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Por favor ingresa tu teléfono";
                  if (value.length < 10) return "Número demasiado corto";
                  if (value.length > 15) return "Número demasiado largo";
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _mostrarPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _mostrarPassword = !_mostrarPassword;
                      });
                    },
                  ),
                ),
                obscureText: !_mostrarPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por favor ingresa tu contraseña";
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
                decoration: InputDecoration(
                  labelText: "Confirmar contraseña",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _mostrarConfirmPassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _mostrarConfirmPassword = !_mostrarConfirmPassword;
                      });
                    },
                  ),
                ),
                obscureText: !_mostrarConfirmPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirma tu contraseña";
                  }
                  if (value != passwordController.text) {
                    return "Las contraseñas no coinciden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: registroUsuario,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
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
