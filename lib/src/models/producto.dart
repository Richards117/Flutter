import 'dart:convert';

class Product {
  final LineaBalanceEmulsion lineaBalanceEmulsion;
  final LineaSensPeel lineaSensPeel;

  Product({
    required this.lineaBalanceEmulsion,
    required this.lineaSensPeel,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        lineaBalanceEmulsion:
            LineaBalanceEmulsion.fromJson(json["linea balance emulsion"]),
        lineaSensPeel: LineaSensPeel.fromJson(json["linea sens peel"]),
      );

  Map<String, dynamic> toJson() => {
        "linea balance emulsion": lineaBalanceEmulsion.toJson(),
        "linea sens peel": lineaSensPeel.toJson(),
      };
}

class LineaBalanceEmulsion {
  final Dermolimpiador dermolimpiador;
  final Hidralip hidralip;
  final Hidralip locion;
  final Hidralip shampoo;

  LineaBalanceEmulsion({
    required this.dermolimpiador,
    required this.hidralip,
    required this.locion,
    required this.shampoo,
  });

  factory LineaBalanceEmulsion.fromRawJson(String str) =>
      LineaBalanceEmulsion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineaBalanceEmulsion.fromJson(Map<String, dynamic> json) =>
      LineaBalanceEmulsion(
        dermolimpiador: Dermolimpiador.fromJson(json["dermolimpiador"]),
        hidralip: Hidralip.fromJson(json["hidralip"]),
        locion: Hidralip.fromJson(json["locion"]),
        shampoo: Hidralip.fromJson(json["shampoo"]),
      );

  Map<String, dynamic> toJson() => {
        "dermolimpiador": dermolimpiador.toJson(),
        "hidralip": hidralip.toJson(),
        "locion": locion.toJson(),
        "shampoo": shampoo.toJson(),
      };
}

class Dermolimpiador {
  final String available;
  final String imagen;
  final String nombre;
  final int precio;

  Dermolimpiador({
    required this.available,
    required this.imagen,
    required this.nombre,
    required this.precio,
  });

  factory Dermolimpiador.fromRawJson(String str) =>
      Dermolimpiador.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dermolimpiador.fromJson(Map<String, dynamic> json) => Dermolimpiador(
        available: json["available"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };
}

class Hidralip {
  final bool available;
  final String imagen;
  final String nombre;
  final int precio;

  Hidralip({
    required this.available,
    required this.imagen,
    required this.nombre,
    required this.precio,
  });

  factory Hidralip.fromRawJson(String str) =>
      Hidralip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hidralip.fromJson(Map<String, dynamic> json) => Hidralip(
        available: json["available"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "imagen": imagen,
        "nombre": nombre,
        "precio": precio,
      };
}

class LineaSensPeel {
  final Hidralip ampolleta;
  final Espuma espuma;
  final Hidralip hidralip;
  final Hidralip locion;
  final Hidralip plastiMask;

  LineaSensPeel({
    required this.ampolleta,
    required this.espuma,
    required this.hidralip,
    required this.locion,
    required this.plastiMask,
  });

  factory LineaSensPeel.fromRawJson(String str) =>
      LineaSensPeel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LineaSensPeel.fromJson(Map<String, dynamic> json) => LineaSensPeel(
        ampolleta: Hidralip.fromJson(json["ampolleta"]),
        espuma: Espuma.fromJson(json["espuma"]),
        hidralip: Hidralip.fromJson(json["hidralip"]),
        locion: Hidralip.fromJson(json["locion"]),
        plastiMask: Hidralip.fromJson(json["plasti mask"]),
      );

  Map<String, dynamic> toJson() => {
        "ampolleta": ampolleta.toJson(),
        "espuma": espuma.toJson(),
        "hidralip": hidralip.toJson(),
        "locion": locion.toJson(),
        "plasti mask": plastiMask.toJson(),
      };
}

class Espuma {
  final bool available;
  final String imgaen;
  final String nombre;
  final int precio;

  Espuma({
    required this.available,
    required this.imgaen,
    required this.nombre,
    required this.precio,
  });

  factory Espuma.fromRawJson(String str) => Espuma.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Espuma.fromJson(Map<String, dynamic> json) => Espuma(
        available: json["available"],
        imgaen: json["imgaen"],
        nombre: json["nombre"],
        precio: json["precio"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "imgaen": imgaen,
        "nombre": nombre,
        "precio": precio,
      };
}
