class DetalleAsistencia {
  int? id_est;
  int? asistencia_ad;
  int? id_registro_persona;
  

  DetalleAsistencia({
    this.id_est,
     this.asistencia_ad,
    this.id_registro_persona,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_est': id_est,
      'asistencia_ad': asistencia_ad,
      'id_registro_persona': id_registro_persona,
    };
  }
}
