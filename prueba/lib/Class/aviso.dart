class Aviso {
  String id;
  String titulo;
  String cuerpo;
  String fecha;
  String estado;
  String imageUrl; // Add this line

  Aviso({
    required this.id,
    required this.titulo,
    required this.cuerpo,
    required this.fecha,
    required this.estado,
    this.imageUrl = '', // Add this line
  });

  // Modify toMap method to include imageUrl
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'cuerpo': cuerpo,
      'fecha': fecha,
      'estado': estado,
      'imageUrl': imageUrl, // Add this line
    };
  }

  // Modify fromMap constructor to include imageUrl
  factory Aviso.fromMap(Map<String, dynamic> map) {
    return Aviso(
      id: map['id'] ?? '',
      titulo: map['titulo'] ?? '',
      cuerpo: map['cuerpo'] ?? '',
      fecha: map['fecha'] ?? '',
      estado: map['estado'] ?? '',
      imageUrl: map['imageUrl'] ?? '', // Add this line
    );
  }
}
