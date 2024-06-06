class Bazar {
  int precio;
  String nombre;
  String id;

  Bazar({required this.precio, required this.nombre, required this.id});

  factory Bazar.fromMap(Map<String, dynamic> map) {
    return Bazar(
        id: map['id'],
        precio: map['precio_espacio'],
        nombre: map['nombre']
    );
  }
}