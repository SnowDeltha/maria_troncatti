class Users {
  
  final int? id;
  final String? nombre;
  final String? apellido;
  final String? cargo;
  final String? rol;
  final String? email;
  final String? password;

  
  const Users({
     this.id,
     this.nombre,
     this.apellido,
     this.cargo,
     this.rol,
     this.email,
     this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      cargo: json['cargo'],
      rol: json['rol'],
      email: json['email'],
      password: json['password'],
    );
  } 
}