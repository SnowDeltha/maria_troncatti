class Estudiantes {
  int? id;
  String? nombre_es;
  int? id_aulas;
  Estudiantes(
      {
      this.nombre_es,
      this.id_aulas,
      this.id,
      });
  factory Estudiantes.fromJson(Map<String, dynamic> json) {
    return Estudiantes(
      id: json['id'],
      nombre_es: json['nombre_es'],
      id_aulas: json['id_aulas'],
    );
  }
}