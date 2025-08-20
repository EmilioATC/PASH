import 'package:isar/isar.dart';
import 'actividad.dart';

part 'semana.g.dart';

@collection
class Semana {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime fechaInicio;

  @Index()
  late DateTime fechaFin;
  
  bool estado = true;
  DateTime fechaCreacion = DateTime.now();
  final actividades = IsarLinks<Actividad>();

   int get numeroSemana => 
    ((fechaInicio.difference(DateTime(fechaInicio.year)).inDays) / 7).ceil();
}
