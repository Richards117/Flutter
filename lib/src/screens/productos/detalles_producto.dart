import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/service/cart_service.dart';
import 'package:provider/provider.dart';

class DetallesProductosScreen extends StatelessWidget {
  const DetallesProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 40,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(39, 186, 194, 1),
        title: const Center(
          child: Text(
            'Producto',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: SizedBox.fromSize(
              size: const Size(45, 45),
              child: ClipOval(
                child: Material(
                  color: Colors.white,
                  child: InkWell(
                    splashColor: Colors.yellow,
                    onTap: () {
                      Navigator.pushNamed(context, 'cart');
                    },
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ImagenProducto(),
            const SizedBox(height: 16.0),
            const Text(
              'Nombre del Producto',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Descripción del producto. Esta es una breve descripción que detalla las características y beneficios del producto.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Precio: \$99.99',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                cart.addToCart({});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(39, 186, 194, 1),
              ),
              child: const Text(
                'Añadir al carrito',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImagenProducto extends StatelessWidget {
  const ImagenProducto({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDS_x5jxTg7YqnS9JJxG2lBQjHhZCkT9_0A&s'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
