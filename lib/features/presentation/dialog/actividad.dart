import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/data/models/actividad.dart';
import 'package:isar_app/data/models/semana.dart';
import 'package:isar_app/features/presentation/providers/notification_provider.dart';
import 'package:isar_app/services/notification_service.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

String _getFrecuenciaDisplayName(FrecuenciaNotificacion frecuencia) {
  switch (frecuencia) {
    case FrecuenciaNotificacion.unica:
      return 'Una sola vez';
    case FrecuenciaNotificacion.diaria:
      return 'Todos los días';
    case FrecuenciaNotificacion.semanal:
      return 'Una vez por semana';
    case FrecuenciaNotificacion.personalizada:
      return 'Días específicos';
  }
}

String _getDiaSemanaNombre(int dia) {
  switch (dia) {
    case 1:
      return 'Lun';
    case 2:
      return 'Mar';
    case 3:
      return 'Mié';
    case 4:
      return 'Jue';
    case 5:
      return 'Vie';
    case 6:
      return 'Sáb';
    case 7:
      return 'Dom';
    default:
      return '';
  }
}

void mostrarDialogoActividad(
  BuildContext context,
  WidgetRef ref, {
  Actividad? actividadExistente,
  String? modo,
  Semana? semanaNueva,
}) {
  final isarService = IsarService();
  final TextEditingController nombreCampo = TextEditingController(
    text: actividadExistente?.nombre ?? '',
  );
  final TextEditingController descCampo = TextEditingController(
    text: actividadExistente?.descripcion ?? '',
  );
  final TextEditingController repeticionesCampo = TextEditingController(
    text: actividadExistente?.repeticiones.toString() ?? '1',
  );
  final TextEditingController valorCampo = TextEditingController(
    text: actividadExistente?.valor.toString() ?? '5',
  );

  final settings = ref.read(notificationSettingsProvider);
  bool programarRecordatorio =
      actividadExistente?.notificacionesHabilitadas ?? false;
  FrecuenciaNotificacion frecuenciaSeleccionada =
      actividadExistente?.frecuenciaNotificacion ??
      FrecuenciaNotificacion.unica;
  DateTime? fechaRecordatorio = actividadExistente?.fechaNotificacion;
  TimeOfDay? horaRecordatorio = actividadExistente?.horaNotificacion;
  TimeOfDay? horaDiaria = actividadExistente?.horaNotificacionDiaria;
  TimeOfDay? horaSemanal = actividadExistente?.horaNotificacionSemanal;
  TimeOfDay? horaPersonalizada =
      actividadExistente?.horaNotificacionPersonalizada;
  int? diaSemanalSeleccionado = actividadExistente?.diaSemanaNotificacion;
  List<int> diasPersonalizadosSeleccionados =
      actividadExistente?.diasNotificacionPersonalizada ?? [];
  String mensajePersonalizado =
      actividadExistente?.mensajeNotificacionPersonalizado ?? '';

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(
              modo == 'crear'
                  ? 'Nueva Actividad'
                  : modo == 'editar'
                  ? 'Editar Actividad'
                  : modo == 'eliminar'
                  ? 'Elimar Actividad'
                  : 'Actividad',
            ),
            content: modo == 'eliminar'
                ? Text(
                    '¿Estás seguro de que quieres eliminar la actividad: ${actividadExistente?.nombre}?',
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: nombreCampo,
                          decoration: const InputDecoration(
                            labelText: 'Nombre',
                            errorText: null,
                          ),
                        ),
                        TextField(
                          controller: descCampo,
                          decoration: const InputDecoration(
                            labelText: 'Descripción',
                            errorText: null,
                          ),
                        ),
                        TextField(
                          controller: repeticionesCampo,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Repeticiones',
                          ),
                        ),
                        TextField(
                          controller: valorCampo,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(labelText: 'Valor'),
                        ),
                        // Notificaciones
                        if (settings.activityReminders &&
                            modo != 'eliminar') ...[
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.notifications, size: 20),
                              const SizedBox(width: 8),
                              const Text(
                                'Recordatorios de Actividad',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          SwitchListTile(
                            title: const Text('Habilitar recordatorios'),
                            subtitle: const Text(
                              'Recibe notificaciones para esta actividad',
                            ),
                            value: programarRecordatorio,
                            onChanged: (value) {
                              setState(() {
                                programarRecordatorio = value;
                              });
                            },
                          ),

                          if (programarRecordatorio) ...[
                            const SizedBox(height: 16),
                            const Text(
                              'Frecuencia de recordatorios:',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),

                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<FrecuenciaNotificacion>(
                                value: frecuenciaSeleccionada,
                                isExpanded: true,
                                underline: const SizedBox(),
                                items: FrecuenciaNotificacion.values.map((
                                  frecuencia,
                                ) {
                                  return DropdownMenuItem(
                                    value: frecuencia,
                                    child: Text(
                                      _getFrecuenciaDisplayName(frecuencia),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      frecuenciaSeleccionada = value;
                                      if (value ==
                                          FrecuenciaNotificacion.unica) {
                                        horaDiaria = null;
                                        diaSemanalSeleccionado = null;
                                        horaSemanal = null;
                                        diasPersonalizadosSeleccionados = [];
                                        horaPersonalizada = null;
                                      } else if (value ==
                                          FrecuenciaNotificacion.diaria) {
                                        fechaRecordatorio = null;
                                        horaRecordatorio = null;
                                        diaSemanalSeleccionado = null;
                                        horaSemanal = null;
                                        diasPersonalizadosSeleccionados = [];
                                        horaPersonalizada = null;
                                      } else if (value ==
                                          FrecuenciaNotificacion.semanal) {
                                        fechaRecordatorio = null;
                                        horaRecordatorio = null;
                                        horaDiaria = null;
                                        diasPersonalizadosSeleccionados = [];
                                        horaPersonalizada = null;
                                      } else if (value ==
                                          FrecuenciaNotificacion
                                              .personalizada) {
                                        fechaRecordatorio = null;
                                        horaRecordatorio = null;
                                        horaDiaria = null;
                                        diaSemanalSeleccionado = null;
                                        horaSemanal = null;
                                      }
                                    });
                                  }
                                },
                              ),
                            ),

                            const SizedBox(height: 16),

                            if (frecuenciaSeleccionada ==
                                FrecuenciaNotificacion.unica) ...[
                              ListTile(
                                leading: const Icon(Icons.calendar_today),
                                title: Text(
                                  fechaRecordatorio != null
                                      ? 'Fecha: ${fechaRecordatorio!.day}/${fechaRecordatorio!.month}/${fechaRecordatorio!.year}'
                                      : 'Seleccionar fecha',
                                ),
                                onTap: () async {
                                  final picked = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        fechaRecordatorio ?? DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 365),
                                    ),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      fechaRecordatorio = picked;
                                    });
                                  }
                                },
                              ),

                              ListTile(
                                leading: const Icon(Icons.access_time),
                                title: Text(
                                  horaRecordatorio != null
                                      ? 'Hora: ${horaRecordatorio!.format(context)}'
                                      : 'Seleccionar hora',
                                ),
                                onTap: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        horaRecordatorio ?? TimeOfDay.now(),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      horaRecordatorio = picked;
                                    });
                                  }
                                },
                              ),
                            ] else if (frecuenciaSeleccionada ==
                                FrecuenciaNotificacion.diaria) ...[
                              ListTile(
                                leading: const Icon(Icons.access_time),
                                title: Text(
                                  horaDiaria != null
                                      ? 'Hora diaria: ${horaDiaria!.format(context)}'
                                      : 'Seleccionar hora diaria',
                                ),
                                onTap: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime: horaDiaria ?? TimeOfDay.now(),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      horaDiaria = picked;
                                    });
                                  }
                                },
                              ),
                            ] else if (frecuenciaSeleccionada ==
                                FrecuenciaNotificacion.semanal) ...[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButton<int>(
                                  value: diaSemanalSeleccionado,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  hint: const Text(
                                    'Seleccionar día de la semana',
                                  ),
                                  items: [
                                    const DropdownMenuItem(
                                      value: 1,
                                      child: Text('Lunes'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 2,
                                      child: Text('Martes'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 3,
                                      child: Text('Miércoles'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 4,
                                      child: Text('Jueves'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 5,
                                      child: Text('Viernes'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 6,
                                      child: Text('Sábado'),
                                    ),
                                    const DropdownMenuItem(
                                      value: 7,
                                      child: Text('Domingo'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      diaSemanalSeleccionado = value;
                                    });
                                  },
                                ),
                              ),

                              const SizedBox(height: 8),

                              ListTile(
                                leading: const Icon(Icons.access_time),
                                title: Text(
                                  horaSemanal != null
                                      ? 'Hora semanal: ${horaSemanal!.format(context)}'
                                      : 'Seleccionar hora semanal',
                                ),
                                onTap: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime: horaSemanal ?? TimeOfDay.now(),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      horaSemanal = picked;
                                    });
                                  }
                                },
                              ),
                            ] else if (frecuenciaSeleccionada ==
                                FrecuenciaNotificacion.personalizada) ...[
                              const Text(
                                'Seleccionar días:',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 8),

                              Wrap(
                                spacing: 8,
                                children: [
                                  for (int dia = 1; dia <= 7; dia++)
                                    FilterChip(
                                      label: Text(_getDiaSemanaNombre(dia)),
                                      selected: diasPersonalizadosSeleccionados
                                          .contains(dia),
                                      onSelected: (selected) {
                                        setState(() {
                                          if (selected) {
                                            diasPersonalizadosSeleccionados.add(
                                              dia,
                                            );
                                          } else {
                                            diasPersonalizadosSeleccionados
                                                .remove(dia);
                                          }
                                        });
                                      },
                                    ),
                                ],
                              ),

                              const SizedBox(height: 8),

                              ListTile(
                                leading: const Icon(Icons.access_time),
                                title: Text(
                                  horaPersonalizada != null
                                      ? 'Hora: ${horaPersonalizada!.format(context)}'
                                      : 'Seleccionar hora',
                                ),
                                onTap: () async {
                                  final picked = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        horaPersonalizada ?? TimeOfDay.now(),
                                  );
                                  if (picked != null) {
                                    setState(() {
                                      horaPersonalizada = picked;
                                    });
                                  }
                                },
                              ),
                            ],

                            const SizedBox(height: 16),

                            TextField(
                              decoration: const InputDecoration(
                                labelText: 'Mensaje personalizado (opcional)',
                                hintText:
                                    'Ej: ¡No olvides completar tu actividad!',
                                border: OutlineInputBorder(),
                              ),
                              maxLines: 2,
                              controller: TextEditingController(
                                text: mensajePersonalizado,
                              ),
                              onChanged: (value) {
                                mensajePersonalizado = value;
                              },
                            ),
                          ],
                        ],
                      ],
                    ),
                  ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final nombre = nombreCampo.text.trim();
                  final descripcion = descCampo.text.trim();
                  final repeticiones =
                      int.tryParse(repeticionesCampo.text) ?? 1;
                  final valor = int.tryParse(valorCampo.text) ?? 5;

                  final isar = IsarService();

                  if (actividadExistente != null && modo == 'editar') {
                    actividadExistente.nombre = nombre;
                    actividadExistente.descripcion = descripcion;
                    actividadExistente.repeticiones = repeticiones;
                    actividadExistente.valor = valor;

                    actividadExistente.notificacionesHabilitadas =
                        programarRecordatorio;
                    if (programarRecordatorio) {
                      actividadExistente.frecuenciaNotificacion =
                          frecuenciaSeleccionada;
                      actividadExistente.mensajeNotificacionPersonalizado =
                          mensajePersonalizado.isNotEmpty
                          ? mensajePersonalizado
                          : null;

                      // Configurar según la frecuencia
                      if (frecuenciaSeleccionada ==
                          FrecuenciaNotificacion.unica) {
                        actividadExistente.fechaNotificacion =
                            fechaRecordatorio;
                        actividadExistente.setHoraNotificacion(
                          horaRecordatorio,
                        );
                      } else if (frecuenciaSeleccionada ==
                          FrecuenciaNotificacion.diaria) {
                        actividadExistente.setHoraNotificacionDiaria(
                          horaDiaria,
                        );
                      } else if (frecuenciaSeleccionada ==
                          FrecuenciaNotificacion.semanal) {
                        actividadExistente.diaSemanaNotificacion =
                            diaSemanalSeleccionado;
                        actividadExistente.setHoraNotificacionSemanal(
                          horaSemanal,
                        );
                      } else if (frecuenciaSeleccionada ==
                          FrecuenciaNotificacion.personalizada) {
                        actividadExistente.diasNotificacionPersonalizada =
                            diasPersonalizadosSeleccionados;
                        actividadExistente.setHoraNotificacionPersonalizada(
                          horaPersonalizada,
                        );
                      }
                    } else {
                      // Deshabilitar notificaciones
                      actividadExistente.notificacionesHabilitadas = false;
                      actividadExistente.idNotificacionProgramada = null;
                    }

                    await isarService.actualizarActividad(actividadExistente);

                    // Gestionar notificaciones después de guardar
                    final notificationService = NotificationService();
                    if (programarRecordatorio) {
                      await notificationService.updateActivityNotification(
                        actividadExistente,
                      );
                    } else {
                      await notificationService.cancelActivityNotification(
                        actividadExistente,
                      );
                    }
                  } else if (actividadExistente != null && modo == 'eliminar') {
                    final notificationService = NotificationService();
                    await notificationService.cancelActivityNotification(
                      actividadExistente,
                    );

                    await isarService.eliminarActividad(actividadExistente.id);
                  } else {
                    final nueva = Actividad()
                      ..nombre = nombre
                      ..descripcion = descripcion
                      ..repeticiones = repeticiones
                      ..valor = valor
                      ..repeticionesCompletadas = 0
                      ..estado = EstadoActividad.pendiente
                      ..semana.value = semanaNueva
                      ..notificacionesHabilitadas = programarRecordatorio;

                    if (programarRecordatorio) {
                      nueva.frecuenciaNotificacion = frecuenciaSeleccionada;
                      nueva.mensajeNotificacionPersonalizado =
                          mensajePersonalizado.isNotEmpty
                          ? mensajePersonalizado
                          : null;

                      if (frecuenciaSeleccionada ==
                          FrecuenciaNotificacion.unica) {
                        nueva.fechaNotificacion = fechaRecordatorio;
                        nueva.setHoraNotificacion(horaRecordatorio);
                      } else if (frecuenciaSeleccionada ==
                          FrecuenciaNotificacion.diaria) {
                        nueva.setHoraNotificacionDiaria(horaDiaria);
                      } else if (frecuenciaSeleccionada ==
                          FrecuenciaNotificacion.semanal) {
                        nueva.diaSemanaNotificacion = diaSemanalSeleccionado;
                        nueva.setHoraNotificacionSemanal(horaSemanal);
                      } else if (frecuenciaSeleccionada ==
                          FrecuenciaNotificacion.personalizada) {
                        nueva.diasNotificacionPersonalizada =
                            diasPersonalizadosSeleccionados;
                        nueva.setHoraNotificacionPersonalizada(
                          horaPersonalizada,
                        );
                      }
                    }

                    final actividadId = await isar.crearActividad(
                      nueva,
                      semanaNueva!,
                    );

                    nueva.id = actividadId;
                    final notificationService = NotificationService();
                    await notificationService
                        .scheduleRecurringActivityNotification(nueva);
                  }

                  if (context.mounted && modo != 'eliminar') {
                    Navigator.pop(context);
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'La acción se realizó correctamente',
                      autoCloseDuration: const Duration(seconds: 3),
                    );
                  } else if (context.mounted) {
                    Navigator.pop(context);
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.info,
                      text: 'La acción se realizó correctamente',
                      autoCloseDuration: const Duration(seconds: 3),
                    );
                  }
                },

                child: Text(actividadExistente == null ? 'Crear' : 'Guardar'),
              ),
            ],
          );
        },
      );
    },
  );
}
