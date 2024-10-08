import 'package:flutter/material.dart';

class AsistenciasScreen extends StatefulWidget {
  const AsistenciasScreen({super.key});

  @override
  AsistenciasScreenState createState() => AsistenciasScreenState();
}

class AsistenciasScreenState extends State<AsistenciasScreen> {
  String selectedGroup = 'Grupo 1';
  Map<String, bool> attendance = {
    'Alumno 1': false,
    'Alumno 2': false,
    'Alumno 3': false,
  };

  void _showAttendanceMessage(String name, bool attended) {
    final message =
        attended ? '$name tuvo asistencia' : '$name no tuvo asistencia';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistencias del Grupo'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedGroup,
              items: const [
                DropdownMenuItem(value: 'Grupo 1', child: Text('Grupo A')),
                DropdownMenuItem(value: 'Grupo 2', child: Text('Grupo B')),
                DropdownMenuItem(value: 'Grupo 3', child: Text('Grupo C')),
                DropdownMenuItem(value: 'Grupo 4', child: Text('Grupo D')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGroup = value!;
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: attendance.keys.map((name) {
                  return SelectorName(
                    name: name,
                    value: attendance[name]!,
                    onChanged: (bool? newValue) {
                      setState(() {
                        attendance[name] = newValue!;
                      });
                      _showAttendanceMessage(name, newValue!);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectorName extends StatelessWidget {
  final String name;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const SelectorName({
    super.key,
    required this.name,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 17,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
        Expanded(child: Container()),
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
