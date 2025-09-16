import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_app/data/local/isar_service.dart';
import 'package:isar_app/data/models/actividad.dart';
import 'package:isar_app/data/models/semana.dart';
import 'package:isar_app/features/presentation/dialog/actividad.dart';
import 'package:isar_app/features/presentation/dialog/semana.dart';
import 'package:isar_app/services/home_widget_service.dart';

class ActividadesScreen extends ConsumerStatefulWidget {
  const ActividadesScreen({super.key});

  @override
  ConsumerState<ActividadesScreen> createState() => _ActividadesScreenState();
}

class _ActividadesScreenState extends ConsumerState<ActividadesScreen> {
  final IsarService _isarService = IsarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF8FAFB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => mostrarDialogoSemana(context, modo: 'crear'),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade700],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 175, 212, 255),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      'Crear Nueva Semana',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: _buildSemanasList()),
          ],
        ),
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
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: semanas.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    child: _SemanaCard(
                      semana: semanas[index],
                      isarService: _isarService,
                      onActividadTap:
                          (ctx, {semanaNueva, actividadExistente, modo}) =>
                              mostrarDialogoActividad(
                                ctx,
                                ref,
                                semanaNueva: semanas[index],
                                actividadExistente: actividadExistente,
                                modo: modo,
                              ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.swipe, color: Colors.blueGrey, size: 22),
                  SizedBox(width: 8),
                  Text(
                    'Desliza para ver otras semanas',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_note, size: 90, color: Colors.blue[100]),
          const SizedBox(height: 20),
          Text(
            'No hay semanas creadas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Crea tu primera semana para comenzar',
            style: TextStyle(fontSize: 15, color: Colors.blueGrey[400]),
          ),
          const SizedBox(height: 28),
          ElevatedButton.icon(
            onPressed: () => mostrarDialogoSemana(context, modo: 'crear'),
            icon: const Icon(Icons.add),
            label: const Text('Crear Primera Semana'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 2,
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
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 214, 233, 255),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: semana.estado ? Colors.blue.shade100 : Colors.grey.shade300,
          width: 1.2,
        ),
      ),
      child: Column(
        children: [
          _buildSemanaHeader(context),
          _buildActividadesList(context),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildSemanaHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: semana.estado
              ? [Colors.blue.shade400, Colors.blue.shade700]
              : [Colors.grey.shade400, Colors.grey.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () =>
                  mostrarDialogoSemana(context, semana: semana, modo: 'editar'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Semana del ${semana.fechaInicio.day}/${semana.fechaInicio.month} al ${semana.fechaFin.day}/${semana.fechaFin.month}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
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
                      return Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white70,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            actividades.isEmpty
                                ? 'Sin actividades'
                                : '$completadas/${actividades.length} completadas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(Icons.star, color: Colors.amber[200], size: 18),
                          const SizedBox(width: 2),
                          Text(
                            '$recompensa pts',
                            style: TextStyle(
                              color: Colors.amber[100],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
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
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 99, 170, 229),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: semana.estado
                ? IconButton(
                    onPressed: () => onActividadTap(
                      context,
                      semanaNueva: semana,
                      modo: 'crear',
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    tooltip: 'Agregar actividad',
                  )
                : IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.arrow_downward_rounded,
                      color: Colors.white,
                    ),
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
                Icon(Icons.lock_outline, size: 48, color: Colors.grey[400]),
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
                  style: TextStyle(color: Colors.grey[500], fontSize: 14),
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
    
    await HomeWidgetService.updateWidgetData();
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade50, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 219, 239, 255),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
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
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: _getStatusColor(),
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: _getStatusColor().withAlpha(18),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            widget.actividad.nombre,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
            style: TextStyle(color: Colors.blueGrey[400], fontSize: 14),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withAlpha(13),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withAlpha(25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
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
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(widget.actividad.repeticiones, (index) {
            final estaMarcado =
                index < widget.actividad.repeticionesCompletadas;
            return GestureDetector(
              onTap: () => _toggleRepeticion(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: estaMarcado ? Colors.green : Colors.white,
                  border: Border.all(
                    color: estaMarcado ? Colors.green : Colors.blue.shade100,
                    width: 2,
                  ),
                  boxShadow: estaMarcado
                      ? [
                          BoxShadow(
                            color: Colors.green.withAlpha(22),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: estaMarcado
                    ? const Icon(Icons.check, size: 22, color: Colors.white)
                    : Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[400],
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
      widget.actividad.repeticionesCompletadas = index;
    } else if (index == widget.actividad.repeticionesCompletadas) {
      widget.actividad.repeticionesCompletadas++;
    }
    _updateEstado();
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
