class ListaAsistencia {
  int? id;
  int? id_aulas;
  String? fecha_registro;
  ListaAsistencia(
      {
      this.id,
      this.id_aulas,
      this.fecha_registro,
      });
  factory ListaAsistencia.fromJson(Map<String, dynamic> json) {
    return ListaAsistencia(
      id: json['id'],
      id_aulas: json['id_aulas'],
      fecha_registro: json['fecha_registro'].toString(),
    );
  }
}
