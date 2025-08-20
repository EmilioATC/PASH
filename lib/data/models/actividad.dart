import 'package:isar/isar.dart';
import 'package:isar_app/data/models/semana.dart';

part 'actividad.g.dart';

enum EstadoActividad {
  pendiente,
  enProgreso,
  completado,
  cancelado
}

@collection
class Actividad {
  Id id = Isar.autoIncrement;

  late String nombre;
  late String descripcion;
  int repeticiones = 1;
  int repeticionesCompletadas = 0;
  int valor = 0;

  @Enumerated(EnumType.name)
  EstadoActividad estado = EstadoActividad.pendiente;

  DateTime fechaCreacion = DateTime.now();
  final semana = IsarLink<Semana>();

  
}
