import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/screens/productos/cart_screen.dart';
import 'package:flutter_application_2/src/screens/navigationbar/navigations_screen.dart';
import 'package:flutter_application_2/src/screens/productos/detalles_producto.dart';
import 'package:flutter_application_2/src/screens/screens.dart';
import 'package:flutter_application_2/src/service/cart_service.dart';
import 'package:flutter_application_2/src/widgets/prueba.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'perfil': (context) => const PerfilScreen(),
        'class': (context) => const DetallesClasesScreen2(),
        'productos': (context) => const DetallesProductosScreen(),
        'cart': (context) => const CartScreen(),
        'po': (context) => const ProductClassScreen()
      },
    );
  }
}
