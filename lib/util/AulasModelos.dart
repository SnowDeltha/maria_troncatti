class Aulas {
  int? id;
  String? nombre_al;
 
  Aulas(
      {this.id,
      this.nombre_al,
      });
  factory Aulas.fromJson(Map<String, dynamic> json) {
    return Aulas(
      id: json['id'],
      nombre_al: json['nombre_al'],
    );
  }
}
