// ignore_for_file: file_names

class Expositor {
  String apellidos;
  String celular;
  String nombre;
  String id;
  String correo;
  bool ntf;

  Expositor(
      {required this.id,
      required this.correo,
      required this.apellidos,
      required this.celular,
      required this.nombre,
      required this.ntf});

  factory Expositor.fromMap(Map<String, dynamic> map) {
    return Expositor(
        id: map['id'],
        correo:  map['correo'],
        apellidos: map['apellidos'],
        celular: map['celular'],
        nombre: map['nombre'],
        ntf: map['ntf']);
  }
}
