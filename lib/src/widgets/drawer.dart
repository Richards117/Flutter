import 'package:flutter/material.dart';

class DrawerOpt extends StatelessWidget {
  const DrawerOpt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 118, 168, 1.0),
            ),
            child: Image(
              image: AssetImage('assets/index.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushNamed(context, 'perfil');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.info,
            ),
            title: const Text('Po'),
            onTap: () {
              Navigator.pushNamed(context, 'po');
            },
          ),
        ],
      ),
    );
  }
}
