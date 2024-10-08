import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/widgets/widgets.dart';

class DetallesClasesScreen extends StatelessWidget {
  const DetallesClasesScreen({super.key});

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
            'Clases',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(39, 186, 194, 1),
        actions: [
          IconButton(
            tooltip: 'Videollamada',
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(Colors.yellow),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.video_call,
              size: 40,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ClassesCard(
        groupName: 'Nombre de la clase',
        backgroundImageUrl:
            'https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/21/13/b5/2113b587-ad8d-1a89-bf77-25af901b7a9a/AppIcon-1x_U007emarketing-0-7-0-sRGB-85-220.png/512x512bb.jpg',
        className: 'Profesor',
        onPlayPressed: () {},
        classNumber: 'Fecha de la clase',
        icon: Icons.ondemand_video_outlined,
      ),
    );
  }
}
