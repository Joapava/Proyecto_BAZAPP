// ignore_for_file: file_names

class Noticia {
  final String urlImagenPerfil;
  final String nombrePerfil;
  final String cuerpoNoticia;
  final String urlImagenNoticia;

  Noticia(this.urlImagenPerfil, this.nombrePerfil, this.cuerpoNoticia, this.urlImagenNoticia);

  Map<String, dynamic> toJson() => {
        'urlImagenPerfil': urlImagenPerfil,
        'nombrePerfil': nombrePerfil,
        'cuerpoNoticia': cuerpoNoticia,
        'urlImagenNoticia': urlImagenNoticia,
      };

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      json['urlImagenPerfil'],
      json['nombrePerfil'],
      json['cuerpoNoticia'],
      json['urlImagenNoticia'],
    );
  }
}

List<Noticia> noticias = [];
