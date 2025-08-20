import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/data/models/actividad.dart';
import 'package:isar_app/features/presentation/widgets/semana_dropdown.dart';

import '../../../../data/models/semana.dart';

Future<void> mostrarDialogoSemana(
  BuildContext context, {
  Semana? semana,
  String? modo,
}) async {
  final formKey = GlobalKey<FormState>();
  final isarService = IsarService();
  DateTime? fechaInicio = modo == "editar" ? semana?.fechaInicio : DateTime.now();
  DateTime? fechaFin =
      semana?.fechaFin ?? DateTime.now().add(const Duration(days: 7));
  bool estado = semana?.estado ?? true;
  bool duplicarActividades = false;
  Semana? selectedFromDropdown;

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          modo == 'crear'
              ? 'Nueva Semana'
              : modo == 'editar'
              ? 'Editar Semana'
              : modo == 'eliminar'
              ? 'Elimar Semana'
              : 'Semana',
        ),
        content: Form(
          key: formKey,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text(
                      fechaInicio == null
                          ? 'Seleccionar fecha de inicio'
                          : 'Inicio: ${DateFormat('dd/MM/yyyy').format(fechaInicio!)}',
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() => fechaInicio = picked);
                      }
                    },
                  ),
                  ListTile(
                    title: Text(
                      fechaFin == null
                          ? 'Seleccionar fecha de fin'
                          : 'Fin: ${DateFormat('dd/MM/yyyy').format(fechaFin!)}',
                    ),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: fechaInicio ?? DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() => fechaFin = picked);
                      }
                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '¿Semana activa?',
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: estado,
                          onChanged: (val) => setState(() => estado = val),
                        ),
                      ],
                    ),
                  ),
                  semana == null && modo != 'editar'
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Duplicar las actividades de la semana anterior',
                                  style: TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  softWrap: true,
                                ),
                              ),
                              Switch(
                                value: duplicarActividades,
                                onChanged: (val) =>
                                    setState(() => duplicarActividades = val),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  duplicarActividades
                      ? DropdownConIsar(
                          onChanged: (value) {
                            setState(() {
                              selectedFromDropdown = value;
                            });
                          },
                        )
                      : const SizedBox(),
                ],
              );
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Guardar"),
            onPressed: () async {
              if (fechaInicio == null || fechaFin == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Selecciona ambas fechas')),
                );
                return;
              }
              if (fechaInicio!.isAfter(fechaFin!)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'La fecha de inicio no puede ser posterior a la de fin',
                    ),
                  ),
                );
                return;
              }

              if (semana != null && modo == 'editar') {
                semana.fechaInicio = fechaInicio!;
                semana.fechaFin = fechaFin!;
                semana.estado = estado;
                await isarService.actualizarSemana(semana);
              } else if (semana != null && modo == 'eliminar') {
                await isarService.eliminarSemana(semana.id);
              } else {
                final nuevaSemana = Semana()
                  ..fechaInicio = fechaInicio!
                  ..fechaFin = fechaFin!
                  ..estado = estado;
                final semanaNueva = await isarService.crearSemana(nuevaSemana);
                if (duplicarActividades && selectedFromDropdown != null) {
                  final actividades = await isarService
                      .obtenerActividadesPorSemanaByList(selectedFromDropdown!);
                  for (var actividad in actividades) {
                    final nuevaActividad = Actividad()
                      ..nombre = actividad.nombre
                      ..descripcion = actividad.descripcion
                      ..repeticiones = actividad.repeticiones
                      ..valor = actividad.valor
                      ..repeticionesCompletadas = 0
                      ..estado = EstadoActividad.pendiente
                      ..semana.value = semanaNueva;
                    await isarService.crearActividad(
                      nuevaActividad,
                      semanaNueva,
                    );
                  }
                  const SnackBar(
                    content: Text(
                      'Se agregaron las actividades de la semana anterior',
                    ),
                  );
                }
              }

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
        ],
      );
    },
  );
}
