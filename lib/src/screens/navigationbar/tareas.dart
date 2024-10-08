import 'package:flutter/material.dart';

class TareasScreen extends StatelessWidget {
  const TareasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
          color: Colors.white,
        ),
        title: const Center(
          child: Text(
            'Tareas',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(39, 186, 194, 1),
      ),
      body: const Center(
        child: Text('tareas'),
      ),
    );
  }
}
