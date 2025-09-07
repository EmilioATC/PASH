import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar_app/features/presentation/providers/user_provider.dart';

Future<void> mostrarDialogoName(
  BuildContext context,
  WidgetRef ref, {
  String? modo,
}) async {
  final TextEditingController nameController = TextEditingController(
    text: ref.read(nameProvider) ?? "",
  );

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(modo == 'crear' ? 'Ingresa tu nombre' : 'Edita tu nombre'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  errorText: null,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              ref.read(nameProvider.notifier).setName("Anónimo");
              if (context.mounted) {
                Navigator.pop(context);
                if (modo == "crear") {
                  context.go('/');
                }
              }
            },
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              ref.read(nameProvider.notifier).setName(nameController.text);

              if (context.mounted) {
                Navigator.pop(context);
                if (modo == "crear") {
                  context.go('/');
                }
              }
            },

            child: Text(modo == "crear" ? 'Crear' : 'Guardar'),
          ),
        ],
      );
    },
  );
}
