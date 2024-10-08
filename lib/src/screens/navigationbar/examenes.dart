import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/widgets/widgets.dart';

class ExamenesScreen extends StatelessWidget {
  const ExamenesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClassesCard(
        groupName: 'Examen de Matemáticas',
        backgroundImageUrl: '',
        className: 'Matemáticas',
        classNumber: 'Fecha: 2024-07-15',
        examDuration: '90 minutos',
        questionCount: 50,
        isPendingReview: true,
        showExamInfo: true,
        onPlayPressed: () {},
        icon: Icons.description_outlined,
      ),
    );
  }
}
