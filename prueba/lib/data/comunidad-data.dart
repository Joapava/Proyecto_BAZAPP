class FormatoPuesto {
  final String urlImagenPerfil;
  final String nombrePerfil;
  final String profesion;
  final String informacionPuesto;
  final String giroPuesto;

  FormatoPuesto(this.urlImagenPerfil, this.nombrePerfil, this.profesion, this.informacionPuesto, this.giroPuesto);
}

List<FormatoPuesto> formatosPuesto = [
  
  FormatoPuesto("https://scontent.fmxl1-1.fna.fbcdn.net/v/t39.30808-6/313209199_565884615382137_8275659793345151733_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHaPVQvXsI1LcDBIFLV-CWUWoWbG-BXWKhahZsb4FdYqEQqwymaljV0bglI86Fa0ywwE8yjFmM8xlj9u8onyX_C&_nc_ohc=LJhOqtX21hcAX-mmz_k&_nc_ht=scontent.fmxl1-1.fna&oh=00_AfC4Up6G2ZQ4H8dLf8YtDnVC5VSIvoe63ABOF6fq-EdhMg&oe=660B4288", "BAZAR Vintage Clothing ", "Emprendedor", "Dueño","comida"),
  FormatoPuesto("https://scontent.fmxl1-1.fna.fbcdn.net/v/t39.30808-6/313209199_565884615382137_8275659793345151733_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHaPVQvXsI1LcDBIFLV-CWUWoWbG-BXWKhahZsb4FdYqEQqwymaljV0bglI86Fa0ywwE8yjFmM8xlj9u8onyX_C&_nc_ohc=LJhOqtX21hcAX-mmz_k&_nc_ht=scontent.fmxl1-1.fna&oh=00_AfC4Up6G2ZQ4H8dLf8YtDnVC5VSIvoe63ABOF6fq-EdhMg&oe=660B4288", "BAZAR Vintage Clothing ", "Emprendedor", "Dueño","comida"),
  FormatoPuesto("https://scontent.fmxl1-1.fna.fbcdn.net/v/t39.30808-6/313209199_565884615382137_8275659793345151733_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHaPVQvXsI1LcDBIFLV-CWUWoWbG-BXWKhahZsb4FdYqEQqwymaljV0bglI86Fa0ywwE8yjFmM8xlj9u8onyX_C&_nc_ohc=LJhOqtX21hcAX-mmz_k&_nc_ht=scontent.fmxl1-1.fna&oh=00_AfC4Up6G2ZQ4H8dLf8YtDnVC5VSIvoe63ABOF6fq-EdhMg&oe=660B4288", "BAZAR Vintage Clothing ", "Emprendedor", "Dueño","ropa"),
  FormatoPuesto("https://scontent.fmxl1-1.fna.fbcdn.net/v/t39.30808-6/313209199_565884615382137_8275659793345151733_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHaPVQvXsI1LcDBIFLV-CWUWoWbG-BXWKhahZsb4FdYqEQqwymaljV0bglI86Fa0ywwE8yjFmM8xlj9u8onyX_C&_nc_ohc=LJhOqtX21hcAX-mmz_k&_nc_ht=scontent.fmxl1-1.fna&oh=00_AfC4Up6G2ZQ4H8dLf8YtDnVC5VSIvoe63ABOF6fq-EdhMg&oe=660B4288", "BAZAR Vintage Clothing ", "Emprendedor", "Dueño","ropa"),
  FormatoPuesto("https://scontent.fmxl1-1.fna.fbcdn.net/v/t39.30808-6/313209199_565884615382137_8275659793345151733_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHaPVQvXsI1LcDBIFLV-CWUWoWbG-BXWKhahZsb4FdYqEQqwymaljV0bglI86Fa0ywwE8yjFmM8xlj9u8onyX_C&_nc_ohc=LJhOqtX21hcAX-mmz_k&_nc_ht=scontent.fmxl1-1.fna&oh=00_AfC4Up6G2ZQ4H8dLf8YtDnVC5VSIvoe63ABOF6fq-EdhMg&oe=660B4288", "BAZAR Vintage Clothing ", "Emprendedor", "Dueño","comida"),
  FormatoPuesto("https://scontent.fmxl1-1.fna.fbcdn.net/v/t39.30808-6/313209199_565884615382137_8275659793345151733_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHaPVQvXsI1LcDBIFLV-CWUWoWbG-BXWKhahZsb4FdYqEQqwymaljV0bglI86Fa0ywwE8yjFmM8xlj9u8onyX_C&_nc_ohc=LJhOqtX21hcAX-mmz_k&_nc_ht=scontent.fmxl1-1.fna&oh=00_AfC4Up6G2ZQ4H8dLf8YtDnVC5VSIvoe63ABOF6fq-EdhMg&oe=660B4288", "BAZAR Vintage Clothing ", "Emprendedor", "Dueño","comida"),
  FormatoPuesto("https://scontent.fmxl1-1.fna.fbcdn.net/v/t39.30808-6/313209199_565884615382137_8275659793345151733_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHaPVQvXsI1LcDBIFLV-CWUWoWbG-BXWKhahZsb4FdYqEQqwymaljV0bglI86Fa0ywwE8yjFmM8xlj9u8onyX_C&_nc_ohc=LJhOqtX21hcAX-mmz_k&_nc_ht=scontent.fmxl1-1.fna&oh=00_AfC4Up6G2ZQ4H8dLf8YtDnVC5VSIvoe63ABOF6fq-EdhMg&oe=660B4288", "BAZAR Vintage Clothing ", "Emprendedor", "Dueño","ropa"),
  FormatoPuesto("https://scontent.fmxl1-1.fna.fbcdn.net/v/t39.30808-6/313209199_565884615382137_8275659793345151733_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHaPVQvXsI1LcDBIFLV-CWUWoWbG-BXWKhahZsb4FdYqEQqwymaljV0bglI86Fa0ywwE8yjFmM8xlj9u8onyX_C&_nc_ohc=LJhOqtX21hcAX-mmz_k&_nc_ht=scontent.fmxl1-1.fna&oh=00_AfC4Up6G2ZQ4H8dLf8YtDnVC5VSIvoe63ABOF6fq-EdhMg&oe=660B4288", "BAZAR Vintage Clothing ", "Emprendedor", "Dueño","ropa"),

];

