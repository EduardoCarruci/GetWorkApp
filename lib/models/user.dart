class Users {
  List<User> items = new List();

  Users();

  Users.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final work = new User.fromJson(item);
      items.add(work);
    } //fin for
  }

  Users.fromJsonMap(decodedData); //fin constructor

}

class User {
  int id;
  String rol;
  String nrodocumentoidentidad;
  String nrofijo;
  String descripcion;
  String direccion;
  String nickname;
  String imagen;
  String email;
  String email_verified_at;
  String created_at;

  User({
    this.id,
    this.rol,
    this.nrodocumentoidentidad,
    this.nrofijo,
    this.descripcion,
    this.direccion,
    this.nickname,
    this.imagen,
    this.email,
    this.email_verified_at,
    this.created_at,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    rol = json["rol"];
    nrodocumentoidentidad = json["nrodocumentoidentidad"];
    nrofijo = json["nrofijo"];
    descripcion = json["descripcion"];
    direccion = json["direccion"];
    nickname = json["nickname"];
    imagen = json["imagen"];
    email = json["email"];
    email_verified_at = json["email_verified_at"];
    created_at = json["created_at"];
  }
  User.mapeado(Map<String, dynamic> json) {
    id = json["id"];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "rol": rol,
        "nrodocumentoidentidad": nrodocumentoidentidad,
        "nrofijo": nrofijo,
        "descripcion": descripcion,
        "direccion": direccion,
        "nickname": nickname,
        "imagen": imagen,
        "email": email,
        "email_verified_at": email_verified_at,
        "created_at": created_at,
      };
}
