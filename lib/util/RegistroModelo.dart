class Registro{
  int? id_est;
  int? asistecia_ad;
  String? fecha_ad;


  Registro(
      {this.id_est,
      this.asistecia_ad,
      this.fecha_ad
      });


      factory Registro.fromJson(Map<String, dynamic> json) {
    return Registro(
      id_est: json['id_est'],
      asistecia_ad: json['asistecia_ad'],
      fecha_ad: json['fecha_ad'],
    );
  }

}