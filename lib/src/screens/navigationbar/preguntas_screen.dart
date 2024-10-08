import 'package:flutter/material.dart';

class PreguntasScreen extends StatelessWidget {
  const PreguntasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _FAQPage(),
      ),
    );
  }
}

class _FAQPage extends StatelessWidget {
  final List<FAQ> faqs = [
    FAQ(
      question: '¿Cómo puedo ingresar a mi clase?',
      answer:
          'Para ingresar a tu clase, sigue estos pasos: \n1. En la pantalla principal, busca tu grupo. \n2. Haz clic en tu grupo para entrar. \n3. Una vez dentro, verás un ícono de una puerta. \n4. Haz clic en el ícono de la puerta para unirte a la llamada de tu clase.',
    ),
    FAQ(
      question: '¿Cómo puedo contactar a mi profesor?',
      answer:
          'Puedes contactar a tu profesor con diferentes metodos:\n1.Con su correo electornico o preguntar a control escolar.',
    ),
    FAQ(
      question: '¿Dónde puedo ver mis calificaciones?',
      answer:
          'Tus calificaciones están disponibles en la sección de "Mis Calificaciones" en el menú principal. Allí encontrarás todas tus calificaciones detalladas por curso.',
    ),
    FAQ(
      question:
          '¿Qué hago si no se me ve o no se me eschuca en la videollamada de una clase?',
      answer:
          'Si no se te escuha o ve es probable que sean los permisos de Google sobre la camara y el microfono de tu Dispositivo, Tendras que reactivar los permisos para estas funciones:\n1. Ingresa a la videollamada\n2.Dirigete a la parte superior de tu pagina y veras la barra de busqueda\n3.De lado izquierdo de este estara un icono con el nombre de:Consulta la informacion del sitio , haz click en el.\n4.Una vez ahi es darle click al boton de Restablecer y volver a recargar la pagina  ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return _FAQItem(faq: faqs[index]);
        },
      ),
    );
  }
}

class _FAQItem extends StatefulWidget {
  final FAQ faq;

  const _FAQItem({required this.faq});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.grey.shade100,
        child: ListTile(
          title: Text(
            widget.faq.question,
            style: const TextStyle(
              color: Color.fromRGBO(26, 150, 156, 1),
              fontWeight: FontWeight.w900,
            ),
          ),
          trailing: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
          onTap: _toggleExpanded,
          subtitle: AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                widget.faq.answer,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ),
      ),
    );
  }
}

class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}

//cos221125dj9

