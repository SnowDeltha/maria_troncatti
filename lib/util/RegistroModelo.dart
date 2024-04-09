class Registro{
  int? id_aula;
  int? id;
  String? fecha_registro;


  Registro(
      {this.id_aula,
      this.id,
      this.fecha_registro
      });


      factory Registro.fromJson(Map<String, dynamic> json) {
    return Registro(
      id_aula: json['id_aula'],
      id: json['id'],
      fecha_registro: json['fecha_registro'],
    );
  }

}