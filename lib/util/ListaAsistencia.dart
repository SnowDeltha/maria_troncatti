class ListaAsistencia {
  int? id;
  int? id_aula;
  String? fecha_registro;
  ListaAsistencia(
      {
      this.id,
      this.id_aula,
      this.fecha_registro,
      });
  factory ListaAsistencia.fromJson(Map<String, dynamic> json) {
    return ListaAsistencia(
      id: json['id'],
      id_aula: json['id_aula'],
      fecha_registro: json['fecha_registro'].toString(),
    );
  }
}
