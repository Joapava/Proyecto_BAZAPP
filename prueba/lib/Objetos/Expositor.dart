class Expositor{
  String apellidos;
  String celular;
  String password;
  String correo;
  String nombre;

  Expositor({required this.apellidos, required this.celular, required this.password, required this.correo, required this.nombre});

  factory Expositor.fromMap(Map<String, dynamic> map) {
    return Expositor(
      apellidos: map['apellidos'],
      celular: map['celular'],
      password: map['contrasena'],
      correo:  map['correo'],
      nombre: map['nombre']
    );
  }
}