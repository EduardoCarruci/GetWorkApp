class Trabajos {
  List<Trabajo> items = new List();

  Trabajos();

  Trabajos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final work = new Trabajo.fromJsonMap(item);
      items.add(work);
    } //fin for
  } //fin constructor

}

class Trabajo {
  int id;
  String nombre_oferta;
  String descripcion;
  String fechaApertura;
  String fechaCierre;
  String ubicacion;
  int reclutadores_id;

  Trabajo({
    this.id,
    this.nombre_oferta,
    this.descripcion,
    this.fechaApertura,
    this.fechaCierre,
    this.ubicacion,
    this.reclutadores_id,
  });

  Trabajo.fromJsonMap(Map<String, dynamic> json) {
    id = json["id"];
    nombre_oferta = json["nombre_oferta"];
    descripcion = json["descripcion"];
    fechaApertura = json["fechaApertura"];
    fechaCierre = json["fechaCierre"];
    ubicacion = json["ubicacion"];
    reclutadores_id = json["reclutadores_id"];
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre_oferta": nombre_oferta,
        "descripcion": descripcion,
        "fechaApertura": fechaApertura,
        "fechaCierre": fechaCierre,
        "ubicacion": ubicacion,
        "reclutadores_id": reclutadores_id,
      };
}
