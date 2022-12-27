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