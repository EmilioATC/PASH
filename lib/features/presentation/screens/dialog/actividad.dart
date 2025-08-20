import 'package:flutter/material.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/data/models/actividad.dart';
import 'package:isar_app/data/models/semana.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

void mostrarDialogoActividad(
  BuildContext context, {
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

  showDialog(
    context: context,
    builder: (context) {
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
                        errorText: null, // Se mostrará el error manualmente
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
              final repeticiones = int.tryParse(repeticionesCampo.text) ?? 1;
              final valor = int.tryParse(valorCampo.text) ?? 5;

              final isar = IsarService();

              if (actividadExistente != null && modo == 'editar') {
                actividadExistente.nombre = nombre;
                actividadExistente.descripcion = descripcion;
                actividadExistente.repeticiones = repeticiones;
                actividadExistente.valor = valor;

                await isarService.actualizarActividad(actividadExistente);
              } else if (actividadExistente != null && modo == 'eliminar') {
                await isarService.eliminarActividad(actividadExistente.id);
              } else {
                final nueva = Actividad()
                  ..nombre = nombre
                  ..descripcion = descripcion
                  ..repeticiones = repeticiones
                  ..valor = valor
                  ..repeticionesCompletadas = 0
                  ..estado = EstadoActividad.pendiente
                  ..semana.value = semanaNueva;

                await isar.crearActividad(nueva, semanaNueva!);
              }

              if (context.mounted && modo != 'eliminar') {
                Navigator.pop(context);
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'La acción se realizó correctamente',
                  autoCloseDuration: const Duration(seconds: 3),
                );
              } else if (context.mounted ) {
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
}
