class Aulas {
  int? id;
  String? nombre_al;
  Aulas(
      {
      this.nombre_al,
      this.id,
      });
  factory Aulas.fromJson(Map<String, dynamic> json) {
    return Aulas(
      id: json['id'],
      nombre_al: json['nombre_al'],
    );
  }
}

