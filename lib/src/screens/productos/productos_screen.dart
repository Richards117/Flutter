import 'package:flutter/material.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController controllers = ScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(8, 140, 163, 1),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black12,
          ),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              autocorrect: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  color: Colors.black,
                  Icons.search,
                  size: 32,
                ),
                hintText: 'Buscar Producto',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
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
                    child: const Icon(Icons.shopping_cart),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const _CategorySelector(),
          ListProducts(
            controllers: controllers,
          ),
        ],
      ),
    );
  }
}

class _CategorySelector extends StatefulWidget {
  const _CategorySelector();

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<_CategorySelector> {
  String selectedCategory = 'Todas';

  final List<String> categories = [
    'Todas',
    'LÍNEA SENS PEEL',
    'LÍNEA OIL EMULSION',
    'LÍNEA BALANCE EMULSION',
    'LÍNEA WIDAY',
    'LÍNEA ANTIEDAD',
    'LÍNEA DETOX CELL',
    'LÍNEA PROTECTOR SOLAR',
    'LÍNEA PIEL MADURA',
    'LÍNEA CORPORAL',
    'MASCARILLAS PLÁSTICAS',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          const Text(
            'Categoría:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: categories.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({
    super.key,
    required this.controllers,
  });

  final ScrollController controllers;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 12,
        controller: controllers,
        child: ListView.builder(
          controller: controllers,
          itemCount: 10,
          itemBuilder: (_, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(8, 140, 163, 1),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 3),
                    ),
                    child: const Center(
                      child: Text(
                        'Nombre del Producto',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(blurRadius: 40, color: Colors.white)
                          ],
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    '\$500',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      backgroundColor: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 3),
                      boxShadow: const [
                        BoxShadow(blurRadius: 20, color: Colors.black)
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'productos');
                      },
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
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
