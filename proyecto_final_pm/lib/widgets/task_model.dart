class TaskModel{
  String usuario;
  String doc;
  String pass;
  
  TaskModel({
    required this.usuario,
    required this.doc,
    required this.pass,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    usuario: json["usuario"], 
    doc: json["doc"], 
    pass: json["pass"],
    );
}

class UserModel{
  String Cuenta;
  String Nombre;
  String Password;

  UserModel({
    required this.Cuenta,
    required this.Nombre,
    required this.Password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    Cuenta: json["Cuenta"], 
    Nombre: json["Nombre"], 
    Password: json["Password"],
    );
}