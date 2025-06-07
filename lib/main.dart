import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Este archivo se va a generar en el próximo paso
import 'package:qr_flutter/qr_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timbre QR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String datosQR = 'Timbre QR - Usuario: Delfino - Dpto: B';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generador de Timbre QR')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            QrImageView(
              data: datosQR,
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Ingrese texto para el QR',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  datosQR = value;
                });
              },
            ),
            const SizedBox(height: 10),
            const Text('Este QR podrá ser escaneado por el visitante para tocar el timbre.')
          ],
        ),
      ),
    );
  }
}