import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/data/models/semana.dart';

class DropdownConIsar extends StatefulWidget {
  final Function(Semana?) onChanged;
  const DropdownConIsar({super.key, required this.onChanged});

  @override
  State<DropdownConIsar> createState() => _DropdownConIsarState();
}

class _DropdownConIsarState extends State<DropdownConIsar> {
  final IsarService _isarService = IsarService();
  Semana? _semanaSeleccionada;
  late Future<List<Semana>> _futureSemanas;

  @override
  void initState() {
    super.initState();
    _futureSemanas = _isarService.obtenerSemanasList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selecciona una semana:',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 16),

          FutureBuilder<List<Semana>>(
            future: _futureSemanas,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return _buildError(snapshot.error.toString());
              }

              final semanas = snapshot.data ?? [];

              if (semanas.isEmpty) {
                return _buildVacio();
              }

              return DropdownButtonFormField<Semana>(
                value: _semanaSeleccionada,
                hint: const Text('Elige una semana', style: TextStyle(fontSize: 14)),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.only(
                    right: 10,
                    top: 2,
                    bottom: 2,
                    left: 10
                  ),
                ),
                items: semanas.map((semana) {
                  return DropdownMenuItem<Semana>(
                    value: semana,
                    child: Row(
                      children: [
                        Icon(
                          semana.estado
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          size: 16,
                          color: semana.estado ? Colors.green : Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text('${DateFormat('dd/MM/yyyy').format(semana.fechaInicio)} - ${DateFormat('dd/MM/yyyy').format(semana.fechaFin)}'
                        , style: TextStyle(fontSize: 14)
                        ),
                      ],
                    ),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Por favor selecciona una semana' : null,
                onChanged: (Semana? nuevaSemana) {
                  setState(() {
                    _semanaSeleccionada = nuevaSemana;
                  });
                  widget.onChanged(nuevaSemana);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildError(String mensaje) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        border: Border.all(color: Colors.red.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.error, color: Colors.red.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Error al cargar las semanas: $mensaje',
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVacio() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'No hay semanas disponibles',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
