// ignore_for_file: file_names

class Expositor {
  String apellidos;
  String celular;
  String password;
  String correo;
  String nombre;
  String id;

  Expositor(
      {required this.id,
      required this.apellidos,
      required this.celular,
      required this.password,
      required this.correo,
      required this.nombre});

  factory Expositor.fromMap(Map<String, dynamic> map) {
    return Expositor(
        id: map['id'],
        apellidos: map['apellidos'],
        celular: map['celular'],
        password: map['contrasena'],
        correo: map['correo'],
        nombre: map['nombre']);
  }
}
