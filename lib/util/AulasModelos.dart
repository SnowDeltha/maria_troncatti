class Aulas {
  String? nombre_al;
  Aulas(
      {
      this.nombre_al,
      });
  factory Aulas.fromJson(Map<String, dynamic> json) {
    return Aulas(
      nombre_al: json['nombre_al'],
    );
  }
}
