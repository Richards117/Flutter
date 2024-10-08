import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/widgets/widgets.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 150, 156, 1),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        title: const Center(
          child: Text(
            'P e r f i l',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                maxRadius: 140,
                backgroundImage: AssetImage('assets/perfil2.png'),
              ),
            ),
            Text(
              'Nombre de ususario',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            CardContainer(
              child: Column(
                children: [
                  Text(
                    'Bienvenido Usuario(a)',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  PerflDesign(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PerflDesign extends StatelessWidget {
  const PerflDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        //contendor Pagar------------------------------------------------
        TextButton(
          onPressed: () {},
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 3,
            height: MediaQuery.of(context).size.height * 0.08,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(95, 170, 176, 1),
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 4),
              ],
            ),
            child: const Text(
              'Pagar suscripcion',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),

        const SizedBox(height: 10),

        //contendor Cerrar Sesion-----------------------------------------
        TextButton(
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(95, 170, 176, 1),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.info, size: 40, color: Colors.red),
                        SizedBox(width: 20),
                        Text(
                          '¡Alerta!',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                content: const Text('¿Esta seguro de cerrar sesión?',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('NO',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            shadows: [
                              BoxShadow(color: Colors.black, blurRadius: 10)
                            ])),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, 'login'),
                    child: const Text('SI',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            shadows: [
                              BoxShadow(color: Colors.red, blurRadius: 10)
                            ])),
                  ),
                ],
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 3,
            height: MediaQuery.of(context).size.height * 0.08,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(95, 170, 176, 1),
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 5)],
            ),
            child: const Text(
              'Cerrar Sesión',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
