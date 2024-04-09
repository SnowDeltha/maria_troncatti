class ReporteModelo {
  int? id;
  int? id_est;
  int? asistencia_ad;
  int? id_registro_persona;
  int? id_aula;
  String? fecha_registro;
  String? nombre_es;

  ReporteModelo(
      {
      this.id,
    this.id_est,
    this.asistencia_ad,
    this.id_registro_persona,
    this.id_aula,
    this.fecha_registro,
    this.nombre_es,
      });

  factory ReporteModelo.fromJson(Map<String, dynamic> json) {
    return ReporteModelo(
      id: json['id'],
      id_est: json['id_est'],
      asistencia_ad: json['asistencia_ad'],
      id_registro_persona: json['id_registro_persona'],
      id_aula: json['id_aula'],
      nombre_es: json['nombre_es'],
      fecha_registro: json['fecha_registro'].toString(),
    );
  }
}
