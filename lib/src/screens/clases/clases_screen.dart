import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/widgets/drawer.dart';
import 'package:flutter_application_2/src/widgets/widgets.dart';

class ClasesScreen extends StatelessWidget {
  const ClasesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Grupos',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(39, 186, 194, 1),
      ),
      drawer: const DrawerOpt(),
      body: ClassesCard(
        groupName: 'Nombre del Grupo',
        backgroundImageUrl:
            'https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/21/13/b5/2113b587-ad8d-1a89-bf77-25af901b7a9a/AppIcon-1x_U007emarketing-0-7-0-sRGB-85-220.png/512x512bb.jpg',
        className: 'Clase subida ',
        classNumber: '1',
        onPlayPressed: () => Navigator.pushNamed(context, 'class'),
        icon: Icons.play_arrow,
      ),
    );
  }
}
