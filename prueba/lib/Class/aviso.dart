class Aviso {
  String id;
  String titulo;
  String cuerpo;
  String fecha;
  String estado;

  Aviso({required this.id, required this.titulo, required this.cuerpo, required this.fecha, required this.estado});

  factory Aviso.fromMap(Map<String, dynamic> map) {
    return Aviso(
      id: map['id'] ?? '',
      titulo: map['titulo'] ?? '',
      cuerpo: map['cuerpo'] ?? '',
      fecha: map['fecha'] ?? 'N/A',
      estado: map['estado'] ?? 'Inactivo',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'cuerpo': cuerpo,
      'fecha': fecha,
      'estado': estado,
    };
  }
}
