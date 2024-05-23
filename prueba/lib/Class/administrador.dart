class Administrador {
  int nivel;
  String idadministrador;
  String idexpositor;

  Administrador(
      {required this.nivel,
      required this.idadministrador,
      required this.idexpositor});

  factory Administrador.fromMap(Map<String, dynamic> map) {
    return Administrador(
        nivel: map['nivel'],
        idadministrador: map['id_administrador'],
        idexpositor: map['id_expositor']);
  }
}
