

// List<DropdownItemsModel> dropdownItemsModelFromJson(String str) =>
//     List<DropdownItemsModel>.from(
//         json.decode(str).map((x) => DropdownItemsModel.fromJson(x)));

// String dropdownItemsModelToJson(List<DropdownItemsModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DropdownItemsModel {

  final int id;
  final String nombre_al;

  DropdownItemsModel({
     required this.id,  
     required this.nombre_al,
  });

  factory DropdownItemsModel.fromJson(Map<String, dynamic> json) =>
      DropdownItemsModel(
        id: json["id"],
        nombre_al: json["nombre_al"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre_al": nombre_al,
      };
}



/* class PostsModel {
 
  int? id;
  String? nombre;
  

  PostsModel({this.id, this.nombre});

  PostsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre_al'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   
    data['id'] = id;
    data['nombre_al'] = nombre;
  
    return data;
  }
} */