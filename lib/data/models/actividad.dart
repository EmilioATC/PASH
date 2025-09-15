import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_app/data/models/semana.dart';

part 'actividad.g.dart';

enum EstadoActividad {
  pendiente,
  enProgreso,
  completado,
  cancelado
}

enum FrecuenciaNotificacion {
  unica, 
  diaria,
  semanal,
  personalizada
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

  Actividad() {
    fechaCreacion = DateTime.now();
  }

  bool notificacionesHabilitadas = false;
  @Enumerated(EnumType.name)
  FrecuenciaNotificacion frecuenciaNotificacion = FrecuenciaNotificacion.unica;

  // Para notificaciones únicas o personalizadas
  DateTime? fechaNotificacion;
  @ignore
  TimeOfDay? horaNotificacion;
  int? horaNotificacionHour;
  int? horaNotificacionMinute;

  // Para notificaciones diarias
  @ignore
  TimeOfDay? horaNotificacionDiaria;
  int? horaNotificacionDiariaHour;
  int? horaNotificacionDiariaMinute;

  // Para notificaciones semanales
  int? diaSemanaNotificacion; // 1 = Lunes, 7 = Domingo
  @ignore
  TimeOfDay? horaNotificacionSemanal;
  int? horaNotificacionSemanalHour;
  int? horaNotificacionSemanalMinute;

  // Para notificaciones personalizadas (días específicos)
  List<int> diasNotificacionPersonalizada = []; // Lista de días de la semana
  @ignore
  TimeOfDay? horaNotificacionPersonalizada;
  int? horaNotificacionPersonalizadaHour;
  int? horaNotificacionPersonalizadaMinute;

  // ID de la notificación programada (para poder cancelarla)
  int? idNotificacionProgramada;

  // Mensaje personalizado para la notificación
  String? mensajeNotificacionPersonalizado;

  // Métodos helper para trabajar con TimeOfDay
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'repeticiones': repeticiones,
      'repeticionesCompletadas': repeticionesCompletadas,
      'valor': valor,
      'estado': estado.name,
      'fechaCreacion': fechaCreacion.toIso8601String(),
      'notificacionesHabilitadas': notificacionesHabilitadas,
      'frecuenciaNotificacion': frecuenciaNotificacion.name,
      'fechaNotificacion': fechaNotificacion?.toIso8601String(),
      'horaNotificacionHour': horaNotificacionHour,
      'horaNotificacionMinute': horaNotificacionMinute,
      'horaNotificacionDiariaHour': horaNotificacionDiariaHour,
      'horaNotificacionDiariaMinute': horaNotificacionDiariaMinute,
      'diaSemanaNotificacion': diaSemanaNotificacion,
      'horaNotificacionSemanalHour': horaNotificacionSemanalHour,
      'horaNotificacionSemanalMinute': horaNotificacionSemanalMinute,
      'diasNotificacionPersonalizada': diasNotificacionPersonalizada,
      'horaNotificacionPersonalizadaHour': horaNotificacionPersonalizadaHour,
      'horaNotificacionPersonalizadaMinute': horaNotificacionPersonalizadaMinute,
      'idNotificacionProgramada': idNotificacionProgramada,
      'mensajeNotificacionPersonalizado': mensajeNotificacionPersonalizado,
    };
  }

  factory Actividad.fromJson(Map<String, dynamic> json) {
    final actividad = Actividad()
      ..id = json['id']
      ..nombre = json['nombre']
      ..descripcion = json['descripcion']
      ..repeticiones = json['repeticiones']
      ..repeticionesCompletadas = json['repeticionesCompletadas']
      ..valor = json['valor']
      ..estado = EstadoActividad.values.firstWhere(
        (e) => e.name == json['estado'],
        orElse: () => EstadoActividad.pendiente,
      )
      ..fechaCreacion = DateTime.parse(json['fechaCreacion'])
      ..notificacionesHabilitadas = json['notificacionesHabilitadas'] ?? false
      ..frecuenciaNotificacion = FrecuenciaNotificacion.values.firstWhere(
        (e) => e.name == json['frecuenciaNotificacion'],
        orElse: () => FrecuenciaNotificacion.unica,
      )
      ..fechaNotificacion = json['fechaNotificacion'] != null
          ? DateTime.parse(json['fechaNotificacion'])
          : null
      ..horaNotificacionHour = json['horaNotificacionHour']
      ..horaNotificacionMinute = json['horaNotificacionMinute']
      ..horaNotificacionDiariaHour = json['horaNotificacionDiariaHour']
      ..horaNotificacionDiariaMinute = json['horaNotificacionDiariaMinute']
      ..diaSemanaNotificacion = json['diaSemanaNotificacion']
      ..horaNotificacionSemanalHour = json['horaNotificacionSemanalHour']
      ..horaNotificacionSemanalMinute = json['horaNotificacionSemanalMinute']
      ..diasNotificacionPersonalizada = List<int>.from(json['diasNotificacionPersonalizada'] ?? [])
      ..horaNotificacionPersonalizadaHour = json['horaNotificacionPersonalizadaHour']
      ..horaNotificacionPersonalizadaMinute = json['horaNotificacionPersonalizadaMinute']
      ..idNotificacionProgramada = json['idNotificacionProgramada']
      ..mensajeNotificacionPersonalizado = json['mensajeNotificacionPersonalizado'];

    // Reconstruir TimeOfDay objects desde los campos separados
    if (actividad.horaNotificacionHour != null && actividad.horaNotificacionMinute != null) {
      actividad.horaNotificacion = TimeOfDay(
        hour: actividad.horaNotificacionHour!,
        minute: actividad.horaNotificacionMinute!,
      );
    }
    if (actividad.horaNotificacionDiariaHour != null && actividad.horaNotificacionDiariaMinute != null) {
      actividad.horaNotificacionDiaria = TimeOfDay(
        hour: actividad.horaNotificacionDiariaHour!,
        minute: actividad.horaNotificacionDiariaMinute!,
      );
    }
    if (actividad.horaNotificacionSemanalHour != null && actividad.horaNotificacionSemanalMinute != null) {
      actividad.horaNotificacionSemanal = TimeOfDay(
        hour: actividad.horaNotificacionSemanalHour!,
        minute: actividad.horaNotificacionSemanalMinute!,
      );
    }
    if (actividad.horaNotificacionPersonalizadaHour != null && actividad.horaNotificacionPersonalizadaMinute != null) {
      actividad.horaNotificacionPersonalizada = TimeOfDay(
        hour: actividad.horaNotificacionPersonalizadaHour!,
        minute: actividad.horaNotificacionPersonalizadaMinute!,
      );
    }

    return actividad;
  }

  // Método para obtener la próxima fecha de notificación
  DateTime? getProximaFechaNotificacion() {
    if (!notificacionesHabilitadas) return null;

    final now = DateTime.now();

    switch (frecuenciaNotificacion) {
      case FrecuenciaNotificacion.unica:
        if (fechaNotificacion != null && horaNotificacion != null) {
          final fechaHora = DateTime(
            fechaNotificacion!.year,
            fechaNotificacion!.month,
            fechaNotificacion!.day,
            horaNotificacion!.hour,
            horaNotificacion!.minute,
          );
          return fechaHora.isAfter(now) ? fechaHora : null;
        }
        return null;

      case FrecuenciaNotificacion.diaria:
        if (horaNotificacionDiaria != null) {
          final hoy = DateTime(now.year, now.month, now.day, horaNotificacionDiaria!.hour, horaNotificacionDiaria!.minute);
          return hoy.isAfter(now) ? hoy : hoy.add(const Duration(days: 1));
        }
        return null;

      case FrecuenciaNotificacion.semanal:
        if (diaSemanaNotificacion != null && horaNotificacionSemanal != null) {
          final fecha = _proximaFechaDiaSemana(diaSemanaNotificacion!, horaNotificacionSemanal!);
          return fecha.isAfter(now) ? fecha : fecha.add(const Duration(days: 7));
        }
        return null;

      case FrecuenciaNotificacion.personalizada:
        if (diasNotificacionPersonalizada.isNotEmpty && horaNotificacionPersonalizada != null) {
          return _proximaFechaDiasPersonalizados(horaNotificacionPersonalizada!);
        }
        return null;
    }
  }

  DateTime _proximaFechaDiaSemana(int diaSemana, TimeOfDay hora) {
    final now = DateTime.now();
    int diasHastaDia = diaSemana - now.weekday;
    if (diasHastaDia <= 0) diasHastaDia += 7;

    final fecha = now.add(Duration(days: diasHastaDia));
    return DateTime(fecha.year, fecha.month, fecha.day, hora.hour, hora.minute);
  }

  DateTime _proximaFechaDiasPersonalizados(TimeOfDay hora) {
    final now = DateTime.now();
    final diaActual = now.weekday;

    // Encontrar el próximo día en la lista
    for (int dia in diasNotificacionPersonalizada) {
      if (dia >= diaActual) {
        final fecha = now.add(Duration(days: dia - diaActual));
        final fechaHora = DateTime(fecha.year, fecha.month, fecha.day, hora.hour, hora.minute);
        if (fechaHora.isAfter(now)) {
          return fechaHora;
        }
      }
    }

    // Si no hay días esta semana, tomar el primer día de la próxima semana
    final primerDia = diasNotificacionPersonalizada.first;
    final fecha = now.add(Duration(days: 7 - diaActual + primerDia));
    return DateTime(fecha.year, fecha.month, fecha.day, hora.hour, hora.minute);
  }

  // Método para obtener el mensaje de notificación
  String getMensajeNotificacion() {
    return mensajeNotificacionPersonalizado ??
           '¡Es hora de trabajar en "$nombre"!';
  }

  // Métodos helper para establecer TimeOfDay y actualizar campos separados
  void setHoraNotificacion(TimeOfDay? time) {
    horaNotificacion = time;
    horaNotificacionHour = time?.hour;
    horaNotificacionMinute = time?.minute;
  }

  void setHoraNotificacionDiaria(TimeOfDay? time) {
    horaNotificacionDiaria = time;
    horaNotificacionDiariaHour = time?.hour;
    horaNotificacionDiariaMinute = time?.minute;
  }

  void setHoraNotificacionSemanal(TimeOfDay? time) {
    horaNotificacionSemanal = time;
    horaNotificacionSemanalHour = time?.hour;
    horaNotificacionSemanalMinute = time?.minute;
  }

  void setHoraNotificacionPersonalizada(TimeOfDay? time) {
    horaNotificacionPersonalizada = time;
    horaNotificacionPersonalizadaHour = time?.hour;
    horaNotificacionPersonalizadaMinute = time?.minute;
  }

  // Método para obtener la hora actual según la frecuencia
  TimeOfDay? getHoraActual() {
    switch (frecuenciaNotificacion) {
      case FrecuenciaNotificacion.unica:
        return horaNotificacion;
      case FrecuenciaNotificacion.diaria:
        return horaNotificacionDiaria;
      case FrecuenciaNotificacion.semanal:
        return horaNotificacionSemanal;
      case FrecuenciaNotificacion.personalizada:
        return horaNotificacionPersonalizada;
    }
  }

  // Método para establecer la hora según la frecuencia
  void setHoraActual(TimeOfDay? time) {
    switch (frecuenciaNotificacion) {
      case FrecuenciaNotificacion.unica:
        setHoraNotificacion(time);
        break;
      case FrecuenciaNotificacion.diaria:
        setHoraNotificacionDiaria(time);
        break;
      case FrecuenciaNotificacion.semanal:
        setHoraNotificacionSemanal(time);
        break;
      case FrecuenciaNotificacion.personalizada:
        setHoraNotificacionPersonalizada(time);
        break;
    }
  }
}
