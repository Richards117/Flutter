import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/screens/clases/detalles_clases.dart';
import 'package:flutter_application_2/src/screens/screens.dart';
import 'package:provider/provider.dart';

class DetallesClasesScreen2 extends StatelessWidget {
  const DetallesClasesScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navagtion(),
      ),
    );
  }
}

class _Navagtion extends StatelessWidget {
  const _Navagtion();

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(color: Colors.black, width: 2),
        ),
      ),
      child: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        onTap: (i) => navegacionModel.paginaActual = i,
        elevation: 2,
        currentIndex: navegacionModel.paginaActual,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_outlined),
            activeIcon: Icon(Icons.home_work),
            label: 'Tareas',
            backgroundColor: Color.fromRGBO(8, 140, 163, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Clases',
            backgroundColor: Color.fromRGBO(26, 150, 156, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list_outlined),
            activeIcon: Icon(Icons.list_alt_outlined),
            label: 'Asistencias',
            backgroundColor: Color.fromRGBO(26, 150, 156, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            activeIcon: Icon(Icons.home_work_outlined),
            label: 'Examenes',
            backgroundColor: Color.fromRGBO(26, 150, 156, 1),
          ),
        ],
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const <Widget>[
        TareasScreen(),
        DetallesClasesScreen(),
        AsistenciasScreen(),
        ExamenesScreen(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 1;
  late final PageController _pageController;

  _NavegacionModel() {
    _pageController = PageController(initialPage: _paginaActual);
  }

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => _pageController;
}
