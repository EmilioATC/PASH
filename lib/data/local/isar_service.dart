import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:isar_app/data/models/semana.dart';
import 'package:isar_app/data/models/actividad.dart';

class IsarService {
  static late Isar isar;

  // Método estático para inicializar la base de datos Isar.
  // Se obtiene el directorio de documentos de la aplicación y se abre la base de datos con el esquema de Actividad.
  static Future<void> initialize() async {
    final dir =
        await getApplicationDocumentsDirectory(); // Obtiene el directorio donde se guardarán los datos.
    isar = await Isar.open(
      [SemanaSchema, ActividadSchema],
      directory: dir.path,
    ); // Abre la base de datos Isar con el esquema Actividad.
  }

  // =====================
  // SEMANA
  // =====================

  Future<Semana> crearSemana(Semana semana) async {
  await isar.writeTxn(() async {
    final id = await isar.semanas.put(semana);
    semana.id = id; 
  });
  return semana;
}


  Stream<List<Semana>> obtenerSemanas() {
    return isar.semanas.where().sortByFechaInicioDesc().watch(fireImmediately: true);
  }

  Future<List<Semana>> obtenerSemanasList() {
    return isar.semanas.where().sortByFechaInicioDesc().findAll();
  }

  Future<void> actualizarSemana(Semana semana) async {
    await isar.writeTxn(() async {
      await isar.semanas.put(semana);
    });
  }

  Future<void> eliminarSemana(int id) async {
    await isar.writeTxn(() async {
      await isar.semanas.delete(id);
    });
  }

  // =====================
  // ACTIVIDAD
  // =====================

  Future<int> crearActividad(Actividad actividad, Semana semana) async {
  return await isar.writeTxn(() async {
    // 1. Primero guardamos o actualizamos la semana si es necesaria
    await isar.semanas.put(semana);
    
    // 2. Establecemos la relación de actividad -> semana
    actividad.semana.value = semana;
    
    // 3. Guardamos la actividad
    final id = await isar.actividads.put(actividad);
    
    // 4. Guardamos el link de actividad -> semana
    await actividad.semana.save();
    
    // 5. IMPORTANTE: Agregamos la actividad a la lista de la semana
    semana.actividades.add(actividad);
    await semana.actividades.save();
    
    return id;
  });
}

  Stream<List<Actividad>> obtenerActividadesPorSemana(Semana semana) {
    return isar.actividads
        .filter()
        .semana((q) => q.idEqualTo(semana.id))
        .watch(fireImmediately: true);
  }

  Future<List<Actividad>> obtenerActividadesPorSemanaByList(
    Semana semana,
  ) async {
    return await isar.actividads
        .filter()
        .semana((q) => q.idEqualTo(semana.id))
        .findAll();
  }

  Future<void> actualizarActividad(Actividad actividad) async {
    await isar.writeTxn(() async {
      await isar.actividads.put(actividad);
    });
  }

  Future<void> eliminarActividad(int id) async {
    await isar.writeTxn(() async {
      await isar.actividads.delete(id);
    });
  }

  Stream<List<Actividad>> obtenerTodasLasActividades() {
    return isar.actividads.where().watch(fireImmediately: true);
  }
}
