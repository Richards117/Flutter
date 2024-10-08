import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/service/cart_service.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 32),
        backgroundColor: const Color.fromRGBO(26, 150, 156, 1),
        title: const Center(
          child: Text(
            'Carrito de Compras',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartProvider.cartItems.isEmpty
                ? const Center(
                    child: Text('El carrito está vacío.'),
                  )
                : ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      var item = cartProvider.cartItems[index];

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        margin: const EdgeInsets.all(15),
                        child: ListTile(
                          leading: item['imageUrl'] != null
                              ? Image.network(
                                  item['imageUrl'],
                                  width: 50,
                                  height: 50,
                                )
                              : const SizedBox.shrink(),
                          title: Text(item['nombre'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text(
                            'Precio: \$${item['precio']}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.remove_circle,
                              size: 34,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              cartProvider.removeFromCart(item);
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
          const Divider(color: Colors.black, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${cartProvider.getTotal().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      side: WidgetStateProperty.all(
                        const BorderSide(color: Colors.black),
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 26, 150, 156),
                      ),
                      overlayColor: WidgetStateProperty.all(Colors.yellow),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'routeName');
                    },
                    child: const Text(
                      'Pagar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
