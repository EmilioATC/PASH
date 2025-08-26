import 'package:flutter/material.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/data/models/actividad.dart';
import 'package:isar_app/data/models/semana.dart';
import 'package:isar_app/features/presentation/dialog/actividad.dart';
import 'package:isar_app/features/presentation/dialog/semana.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ActividadesScreen extends StatefulWidget {
  const ActividadesScreen({super.key});

  @override
  State<ActividadesScreen> createState() => _ActividadesScreenState();
}

class _ActividadesScreenState extends State<ActividadesScreen> {
  final IsarService _isarService = IsarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      body: Column(
        children: [
          //_buildHeader(),
          SizedBox(height: 30),
           GestureDetector(
              onTap: () => mostrarDialogoSemana(context, modo: 'crear'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    'Crear Nueva Semana',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          
          SizedBox(height: 30),
          Expanded(child: _buildSemanasList()),
        ],
      ),
      //floatingActionButton: _buildFAB(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.calendar_today, color: Colors.blue, size: 20),
          ),
          const SizedBox(width: 8),
          const Text(
            'PASH - Planifica tu semana',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 65, 65, 65),
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          // StreamBuilder<List<Semana>>(
          //   stream: _isarService.obtenerSemanas(),
          //   builder: (context, snapshot) {
          //     final semanas = snapshot.data ?? [];
          //     return Text(
          //       '${semanas.length} semanas',
          //       style: TextStyle(
          //         fontSize: 14,
          //         color: Colors.grey[600],
          //         fontWeight: FontWeight.w500,
          //       ),
          //     );
          //   },
          // ),
          IconButton(
            onPressed: () => {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Transaction Completed Successfully!',
                autoCloseDuration: const Duration(seconds: 3),
              ),
            },
            icon: Icon(Icons.more_vert, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton.extended(
      onPressed: () => mostrarDialogoSemana(context, modo: 'crear'),
      backgroundColor: Colors.blue,
      icon: const Icon(Icons.add, color: Colors.white),
      label: const Text(
        'Nueva Semana',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSemanasList() {
    
    return StreamBuilder<List<Semana>>(
      stream: _isarService.obtenerSemanas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final semanas = snapshot.data ?? [];
        if (semanas.isEmpty) {
          return _buildEmptyState();
        }

      return SizedBox(
              height: 400,
              child: PageView.builder(
                padEnds: false,
          itemCount: semanas.length,
          controller: PageController(viewportFraction: 0.85),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: _SemanaCard(
                semana: semanas[index],
                isarService: _isarService,
                onActividadTap: (ctx, {semanaNueva, actividadExistente, modo}) =>
                    mostrarDialogoActividad(
                      ctx,
                      semanaNueva: semanas[index],
                      actividadExistente: actividadExistente,
                      modo: modo,
                    ),
              ),
            );
          },
        ),
      );
      },
    );


  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_note, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No hay semanas creadas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Crea tu primera semana para comenzar',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => mostrarDialogoSemana(context, modo: 'crear'),
            icon: const Icon(Icons.add),
            label: const Text('Crear Primera Semana'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _SemanaCard extends StatelessWidget {
  final Semana semana;
  final IsarService isarService;
  final Function(
    BuildContext, {
    Semana? semanaNueva,
    Actividad? actividadExistente,
    String? modo,
  })
  onActividadTap;

  const _SemanaCard({
    required this.semana,
    required this.isarService,
    required this.onActividadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 210, 210, 210),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [_buildSemanaHeader(context), _buildActividadesList(context)],
      ),
    );
  }

  Widget _buildSemanaHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: semana.estado
              ? [Colors.blue.shade400, Colors.blue.shade600]
              : [Colors.grey.shade500, Colors.grey.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => mostrarDialogoSemana(context, semana: semana, modo: 'editar'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semana del ${semana.fechaInicio.day}/${semana.fechaInicio.month} al ${semana.fechaFin.day}/${semana.fechaFin.month}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  StreamBuilder<List<Actividad>>(
                    stream: isarService.obtenerActividadesPorSemana(semana),
                    builder: (context, snapshot) {
                      final actividades = snapshot.data ?? [];
                      final completadas = actividades
                          .where((a) => a.estado == EstadoActividad.completado)
                          .length;
                      final recompensa = actividades.fold<int>(
                        0,
                        (sum, actividad) =>
                            sum +
                            actividad.valor * actividad.repeticionesCompletadas,
                      );
              
                      return Column(
                        children: [
                          Text(
                            actividades.isEmpty
                                ? 'Sin actividades'
                                : '$completadas de ${actividades.length} completadas con $recompensa pts de recompensa',
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container( 
            decoration: BoxDecoration(
              color: semana.estado
                  ? const Color.fromARGB(255, 99, 170, 229)
                  : Colors.grey.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
            child: semana.estado ? IconButton(
              onPressed: () =>
                  onActividadTap(context, semanaNueva: semana, modo: 'crear'),
              icon: const Icon(Icons.add, color: Colors.white),
              tooltip: 'Agregar actividad',
            ) : IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.arrow_downward_rounded, color: Colors.white),
              tooltip: 'Editar semana',
            ),
          ), 
        ],
      ),
    );
  }

  Widget _buildActividadesList(BuildContext context) {
    return StreamBuilder<List<Actividad>>(
      stream: isarService.obtenerActividadesPorSemana(semana),
      builder: (context, snapshot) {
        final actividades = snapshot.data ?? [];

        if (actividades.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Icon(
                  Icons.assignment_outlined,
                  size: 48,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 12),
                Text(
                  'No hay actividades',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => onActividadTap(context, semanaNueva: semana),
                  child: Text(
                    'Toca aquí para agregar la primera',
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (semana.estado == false) {
          // Si la semana está cerrada, no mostrar actividades
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 48,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 12),
                Text(
                  'Semana cerrada',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'No puedes modificar actividades en una semana cerrada.',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return Column(
          children: actividades.map((actividad) {
            return _ActividadTile(
              actividad: actividad,
              onTap: onActividadTap,
              onRepeticionChanged: () async {
                await _updateActividad(actividad);
              },
            );
          }).toList(),
        );
      },
    );
  }

  Future<void> _updateActividad(Actividad actividad) async {
    await IsarService.isar.writeTxn(() async {
      await IsarService.isar.actividads.put(actividad);
    });
  }
}

class _ActividadTile extends StatefulWidget {
  final Actividad actividad;
  final Function(
    BuildContext, {
    Semana? semanaNueva,
    Actividad? actividadExistente,
    String? modo,
  })
  onTap;
  final VoidCallback onRepeticionChanged;

  const _ActividadTile({
    required this.actividad,
    required this.onTap,
    required this.onRepeticionChanged,
  });

  @override
  State<_ActividadTile> createState() => _ActividadTileState();
}

class _ActividadTileState extends State<_ActividadTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActividadHeader(context),
          const SizedBox(height: 12),
          _buildActividadDetails(),
          const SizedBox(height: 12),
          _buildRepeticionesWidget(),
        ],
      ),
    );
  }

  Widget _buildActividadHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: _getStatusColor(),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            widget.actividad.nombre,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        PopupMenuButton<String>(
          onSelected: (value) {
            widget.onTap(
              context,
              actividadExistente: widget.actividad,
              modo: value,
            );
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'editar',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18),
                  SizedBox(width: 8),
                  Text('Editar'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'eliminar',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 18, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Eliminar', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
          child: const Icon(Icons.more_vert, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildActividadDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.actividad.descripcion.isNotEmpty)
          Text(
            widget.actividad.descripcion,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildInfoChip(
              icon: Icons.flag,
              label:
                  '${widget.actividad.repeticionesCompletadas}/${widget.actividad.repeticiones}',
              color: Colors.orange,
            ),
            const SizedBox(width: 8),
            _buildInfoChip(
              icon: Icons.star,
              label: '${widget.actividad.valor} pts',
              color: Colors.amber,
            ),
            const SizedBox(width: 8),
            _buildInfoChip(
              icon: Icons.circle,
              label: _getStatusText(),
              color: _getStatusColor(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRepeticionesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Progreso:',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(widget.actividad.repeticiones, (index) {
            final estaMarcado =
                index < widget.actividad.repeticionesCompletadas;
            return GestureDetector(
              onTap: () => _toggleRepeticion(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: estaMarcado ? Colors.green : Colors.white,
                  border: Border.all(
                    color: estaMarcado ? Colors.green : Colors.grey.shade300,
                    width: 2,
                  ),
                  boxShadow: estaMarcado
                      ? [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: estaMarcado
                    ? const Icon(Icons.check, size: 20, color: Colors.white)
                    : Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Future<void> _toggleRepeticion(int index) async {
    if (index < widget.actividad.repeticionesCompletadas) {
      // Desmarcar: reducir repeticiones completadas
      widget.actividad.repeticionesCompletadas = index;
    } else if (index == widget.actividad.repeticionesCompletadas) {
      // Marcar la siguiente: aumentar repeticiones completadas
      widget.actividad.repeticionesCompletadas++;
    }

    // Actualizar estado
    _updateEstado();

    // Guardar en base de datos
    widget.onRepeticionChanged();

    setState(() {});
  }

  void _updateEstado() {
    if (widget.actividad.repeticionesCompletadas >=
        widget.actividad.repeticiones) {
      widget.actividad.estado = EstadoActividad.completado;
    } else if (widget.actividad.repeticionesCompletadas > 0) {
      widget.actividad.estado = EstadoActividad.enProgreso;
    } else {
      widget.actividad.estado = EstadoActividad.pendiente;
    }
  }

  Color _getStatusColor() {
    switch (widget.actividad.estado) {
      case EstadoActividad.completado:
        return Colors.green;
      case EstadoActividad.enProgreso:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText() {
    switch (widget.actividad.estado) {
      case EstadoActividad.completado:
        return 'Completado';
      case EstadoActividad.enProgreso:
        return 'En progreso';
      default:
        return 'Pendiente';
    }
  }
}
