// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actividad.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActividadCollection on Isar {
  IsarCollection<Actividad> get actividads => this.collection();
}

const ActividadSchema = CollectionSchema(
  name: r'Actividad',
  id: 4385917325194381269,
  properties: {
    r'descripcion': PropertySchema(
      id: 0,
      name: r'descripcion',
      type: IsarType.string,
    ),
    r'diaSemanaNotificacion': PropertySchema(
      id: 1,
      name: r'diaSemanaNotificacion',
      type: IsarType.long,
    ),
    r'diasNotificacionPersonalizada': PropertySchema(
      id: 2,
      name: r'diasNotificacionPersonalizada',
      type: IsarType.longList,
    ),
    r'estado': PropertySchema(
      id: 3,
      name: r'estado',
      type: IsarType.string,
      enumMap: _ActividadestadoEnumValueMap,
    ),
    r'fechaCreacion': PropertySchema(
      id: 4,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaNotificacion': PropertySchema(
      id: 5,
      name: r'fechaNotificacion',
      type: IsarType.dateTime,
    ),
    r'frecuenciaNotificacion': PropertySchema(
      id: 6,
      name: r'frecuenciaNotificacion',
      type: IsarType.string,
      enumMap: _ActividadfrecuenciaNotificacionEnumValueMap,
    ),
    r'horaNotificacionDiariaHour': PropertySchema(
      id: 7,
      name: r'horaNotificacionDiariaHour',
      type: IsarType.long,
    ),
    r'horaNotificacionDiariaMinute': PropertySchema(
      id: 8,
      name: r'horaNotificacionDiariaMinute',
      type: IsarType.long,
    ),
    r'horaNotificacionHour': PropertySchema(
      id: 9,
      name: r'horaNotificacionHour',
      type: IsarType.long,
    ),
    r'horaNotificacionMinute': PropertySchema(
      id: 10,
      name: r'horaNotificacionMinute',
      type: IsarType.long,
    ),
    r'horaNotificacionPersonalizadaHour': PropertySchema(
      id: 11,
      name: r'horaNotificacionPersonalizadaHour',
      type: IsarType.long,
    ),
    r'horaNotificacionPersonalizadaMinute': PropertySchema(
      id: 12,
      name: r'horaNotificacionPersonalizadaMinute',
      type: IsarType.long,
    ),
    r'horaNotificacionSemanalHour': PropertySchema(
      id: 13,
      name: r'horaNotificacionSemanalHour',
      type: IsarType.long,
    ),
    r'horaNotificacionSemanalMinute': PropertySchema(
      id: 14,
      name: r'horaNotificacionSemanalMinute',
      type: IsarType.long,
    ),
    r'idNotificacionProgramada': PropertySchema(
      id: 15,
      name: r'idNotificacionProgramada',
      type: IsarType.long,
    ),
    r'mensajeNotificacionPersonalizado': PropertySchema(
      id: 16,
      name: r'mensajeNotificacionPersonalizado',
      type: IsarType.string,
    ),
    r'nombre': PropertySchema(
      id: 17,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'notificacionesHabilitadas': PropertySchema(
      id: 18,
      name: r'notificacionesHabilitadas',
      type: IsarType.bool,
    ),
    r'repeticiones': PropertySchema(
      id: 19,
      name: r'repeticiones',
      type: IsarType.long,
    ),
    r'repeticionesCompletadas': PropertySchema(
      id: 20,
      name: r'repeticionesCompletadas',
      type: IsarType.long,
    ),
    r'valor': PropertySchema(
      id: 21,
      name: r'valor',
      type: IsarType.long,
    )
  },
  estimateSize: _actividadEstimateSize,
  serialize: _actividadSerialize,
  deserialize: _actividadDeserialize,
  deserializeProp: _actividadDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'semana': LinkSchema(
      id: 3782127762462482263,
      name: r'semana',
      target: r'Semana',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _actividadGetId,
  getLinks: _actividadGetLinks,
  attach: _actividadAttach,
  version: '3.1.0+1',
);

int _actividadEstimateSize(
  Actividad object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.descripcion.length * 3;
  bytesCount += 3 + object.diasNotificacionPersonalizada.length * 8;
  bytesCount += 3 + object.estado.name.length * 3;
  bytesCount += 3 + object.frecuenciaNotificacion.name.length * 3;
  {
    final value = object.mensajeNotificacionPersonalizado;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  return bytesCount;
}

void _actividadSerialize(
  Actividad object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.descripcion);
  writer.writeLong(offsets[1], object.diaSemanaNotificacion);
  writer.writeLongList(offsets[2], object.diasNotificacionPersonalizada);
  writer.writeString(offsets[3], object.estado.name);
  writer.writeDateTime(offsets[4], object.fechaCreacion);
  writer.writeDateTime(offsets[5], object.fechaNotificacion);
  writer.writeString(offsets[6], object.frecuenciaNotificacion.name);
  writer.writeLong(offsets[7], object.horaNotificacionDiariaHour);
  writer.writeLong(offsets[8], object.horaNotificacionDiariaMinute);
  writer.writeLong(offsets[9], object.horaNotificacionHour);
  writer.writeLong(offsets[10], object.horaNotificacionMinute);
  writer.writeLong(offsets[11], object.horaNotificacionPersonalizadaHour);
  writer.writeLong(offsets[12], object.horaNotificacionPersonalizadaMinute);
  writer.writeLong(offsets[13], object.horaNotificacionSemanalHour);
  writer.writeLong(offsets[14], object.horaNotificacionSemanalMinute);
  writer.writeLong(offsets[15], object.idNotificacionProgramada);
  writer.writeString(offsets[16], object.mensajeNotificacionPersonalizado);
  writer.writeString(offsets[17], object.nombre);
  writer.writeBool(offsets[18], object.notificacionesHabilitadas);
  writer.writeLong(offsets[19], object.repeticiones);
  writer.writeLong(offsets[20], object.repeticionesCompletadas);
  writer.writeLong(offsets[21], object.valor);
}

Actividad _actividadDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Actividad();
  object.descripcion = reader.readString(offsets[0]);
  object.diaSemanaNotificacion = reader.readLongOrNull(offsets[1]);
  object.diasNotificacionPersonalizada = reader.readLongList(offsets[2]) ?? [];
  object.estado =
      _ActividadestadoValueEnumMap[reader.readStringOrNull(offsets[3])] ??
          EstadoActividad.pendiente;
  object.fechaCreacion = reader.readDateTime(offsets[4]);
  object.fechaNotificacion = reader.readDateTimeOrNull(offsets[5]);
  object.frecuenciaNotificacion = _ActividadfrecuenciaNotificacionValueEnumMap[
          reader.readStringOrNull(offsets[6])] ??
      FrecuenciaNotificacion.unica;
  object.horaNotificacionDiariaHour = reader.readLongOrNull(offsets[7]);
  object.horaNotificacionDiariaMinute = reader.readLongOrNull(offsets[8]);
  object.horaNotificacionHour = reader.readLongOrNull(offsets[9]);
  object.horaNotificacionMinute = reader.readLongOrNull(offsets[10]);
  object.horaNotificacionPersonalizadaHour = reader.readLongOrNull(offsets[11]);
  object.horaNotificacionPersonalizadaMinute =
      reader.readLongOrNull(offsets[12]);
  object.horaNotificacionSemanalHour = reader.readLongOrNull(offsets[13]);
  object.horaNotificacionSemanalMinute = reader.readLongOrNull(offsets[14]);
  object.id = id;
  object.idNotificacionProgramada = reader.readLongOrNull(offsets[15]);
  object.mensajeNotificacionPersonalizado =
      reader.readStringOrNull(offsets[16]);
  object.nombre = reader.readString(offsets[17]);
  object.notificacionesHabilitadas = reader.readBool(offsets[18]);
  object.repeticiones = reader.readLong(offsets[19]);
  object.repeticionesCompletadas = reader.readLong(offsets[20]);
  object.valor = reader.readLong(offsets[21]);
  return object;
}

P _actividadDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (_ActividadestadoValueEnumMap[reader.readStringOrNull(offset)] ??
          EstadoActividad.pendiente) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (_ActividadfrecuenciaNotificacionValueEnumMap[
              reader.readStringOrNull(offset)] ??
          FrecuenciaNotificacion.unica) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readLong(offset)) as P;
    case 21:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ActividadestadoEnumValueMap = {
  r'pendiente': r'pendiente',
  r'enProgreso': r'enProgreso',
  r'completado': r'completado',
  r'cancelado': r'cancelado',
};
const _ActividadestadoValueEnumMap = {
  r'pendiente': EstadoActividad.pendiente,
  r'enProgreso': EstadoActividad.enProgreso,
  r'completado': EstadoActividad.completado,
  r'cancelado': EstadoActividad.cancelado,
};
const _ActividadfrecuenciaNotificacionEnumValueMap = {
  r'unica': r'unica',
  r'diaria': r'diaria',
  r'semanal': r'semanal',
  r'personalizada': r'personalizada',
};
const _ActividadfrecuenciaNotificacionValueEnumMap = {
  r'unica': FrecuenciaNotificacion.unica,
  r'diaria': FrecuenciaNotificacion.diaria,
  r'semanal': FrecuenciaNotificacion.semanal,
  r'personalizada': FrecuenciaNotificacion.personalizada,
};

Id _actividadGetId(Actividad object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _actividadGetLinks(Actividad object) {
  return [object.semana];
}

void _actividadAttach(IsarCollection<dynamic> col, Id id, Actividad object) {
  object.id = id;
  object.semana.attach(col, col.isar.collection<Semana>(), r'semana', id);
}

extension ActividadQueryWhereSort
    on QueryBuilder<Actividad, Actividad, QWhere> {
  QueryBuilder<Actividad, Actividad, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActividadQueryWhere
    on QueryBuilder<Actividad, Actividad, QWhereClause> {
  QueryBuilder<Actividad, Actividad, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActividadQueryFilter
    on QueryBuilder<Actividad, Actividad, QFilterCondition> {
  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> descripcionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      descripcionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> descripcionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> descripcionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descripcion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      descripcionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> descripcionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> descripcionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descripcion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> descripcionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descripcion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      descripcionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      descripcionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descripcion',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diaSemanaNotificacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'diaSemanaNotificacion',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diaSemanaNotificacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'diaSemanaNotificacion',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diaSemanaNotificacionEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diaSemanaNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diaSemanaNotificacionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diaSemanaNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diaSemanaNotificacionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diaSemanaNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diaSemanaNotificacionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diaSemanaNotificacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diasNotificacionPersonalizada',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diasNotificacionPersonalizada',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diasNotificacionPersonalizada',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diasNotificacionPersonalizada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diasNotificacionPersonalizada',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diasNotificacionPersonalizada',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diasNotificacionPersonalizada',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diasNotificacionPersonalizada',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diasNotificacionPersonalizada',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      diasNotificacionPersonalizadaLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diasNotificacionPersonalizada',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoEqualTo(
    EstadoActividad value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoGreaterThan(
    EstadoActividad value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoLessThan(
    EstadoActividad value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoBetween(
    EstadoActividad lower,
    EstadoActividad upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'estado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'estado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> estadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'estado',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaCreacionEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaCreacionLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaCreacionBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaNotificacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaNotificacion',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaNotificacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaNotificacion',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaNotificacionEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaNotificacionGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaNotificacionLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaNotificacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      fechaNotificacionBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaNotificacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionEqualTo(
    FrecuenciaNotificacion value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaNotificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionGreaterThan(
    FrecuenciaNotificacion value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frecuenciaNotificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionLessThan(
    FrecuenciaNotificacion value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frecuenciaNotificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionBetween(
    FrecuenciaNotificacion lower,
    FrecuenciaNotificacion upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frecuenciaNotificacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frecuenciaNotificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frecuenciaNotificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frecuenciaNotificacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frecuenciaNotificacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frecuenciaNotificacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      frecuenciaNotificacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frecuenciaNotificacion',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horaNotificacionDiariaHour',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horaNotificacionDiariaHour',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaHourEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaNotificacionDiariaHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaHourGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaNotificacionDiariaHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaHourLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaNotificacionDiariaHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaHourBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaNotificacionDiariaHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaMinuteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horaNotificacionDiariaMinute',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaMinuteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horaNotificacionDiariaMinute',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaMinuteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaNotificacionDiariaMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaMinuteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaNotificacionDiariaMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaMinuteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaNotificacionDiariaMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionDiariaMinuteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaNotificacionDiariaMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horaNotificacionHour',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horaNotificacionHour',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionHourEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaNotificacionHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionHourGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaNotificacionHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionHourLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaNotificacionHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionHourBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaNotificacionHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionMinuteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horaNotificacionMinute',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionMinuteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horaNotificacionMinute',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionMinuteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaNotificacionMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionMinuteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaNotificacionMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionMinuteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaNotificacionMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionMinuteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaNotificacionMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horaNotificacionPersonalizadaHour',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horaNotificacionPersonalizadaHour',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaHourEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaNotificacionPersonalizadaHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaHourGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaNotificacionPersonalizadaHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaHourLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaNotificacionPersonalizadaHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaHourBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaNotificacionPersonalizadaHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaMinuteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horaNotificacionPersonalizadaMinute',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaMinuteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horaNotificacionPersonalizadaMinute',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaMinuteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaNotificacionPersonalizadaMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaMinuteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaNotificacionPersonalizadaMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaMinuteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaNotificacionPersonalizadaMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionPersonalizadaMinuteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaNotificacionPersonalizadaMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horaNotificacionSemanalHour',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horaNotificacionSemanalHour',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalHourEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaNotificacionSemanalHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalHourGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaNotificacionSemanalHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalHourLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaNotificacionSemanalHour',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalHourBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaNotificacionSemanalHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalMinuteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'horaNotificacionSemanalMinute',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalMinuteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'horaNotificacionSemanalMinute',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalMinuteEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaNotificacionSemanalMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalMinuteGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaNotificacionSemanalMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalMinuteLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaNotificacionSemanalMinute',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      horaNotificacionSemanalMinuteBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaNotificacionSemanalMinute',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      idNotificacionProgramadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idNotificacionProgramada',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      idNotificacionProgramadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idNotificacionProgramada',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      idNotificacionProgramadaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idNotificacionProgramada',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      idNotificacionProgramadaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idNotificacionProgramada',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      idNotificacionProgramadaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idNotificacionProgramada',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      idNotificacionProgramadaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idNotificacionProgramada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mensajeNotificacionPersonalizado',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mensajeNotificacionPersonalizado',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mensajeNotificacionPersonalizado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mensajeNotificacionPersonalizado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mensajeNotificacionPersonalizado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mensajeNotificacionPersonalizado',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mensajeNotificacionPersonalizado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mensajeNotificacionPersonalizado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mensajeNotificacionPersonalizado',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mensajeNotificacionPersonalizado',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mensajeNotificacionPersonalizado',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      mensajeNotificacionPersonalizadoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mensajeNotificacionPersonalizado',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      notificacionesHabilitadasEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificacionesHabilitadas',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> repeticionesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeticiones',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      repeticionesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeticiones',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      repeticionesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeticiones',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> repeticionesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeticiones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      repeticionesCompletadasEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeticionesCompletadas',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      repeticionesCompletadasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeticionesCompletadas',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      repeticionesCompletadasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeticionesCompletadas',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition>
      repeticionesCompletadasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeticionesCompletadas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> valorEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> valorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> valorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor',
        value: value,
      ));
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> valorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActividadQueryObject
    on QueryBuilder<Actividad, Actividad, QFilterCondition> {}

extension ActividadQueryLinks
    on QueryBuilder<Actividad, Actividad, QFilterCondition> {
  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> semana(
      FilterQuery<Semana> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'semana');
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterFilterCondition> semanaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'semana', 0, true, 0, true);
    });
  }
}

extension ActividadQuerySortBy on QueryBuilder<Actividad, Actividad, QSortBy> {
  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByDiaSemanaNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diaSemanaNotificacion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByDiaSemanaNotificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diaSemanaNotificacion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByFechaNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaNotificacion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByFechaNotificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaNotificacion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByFrecuenciaNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaNotificacion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByFrecuenciaNotificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaNotificacion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionDiariaHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionDiariaHour', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionDiariaHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionDiariaHour', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionDiariaMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionDiariaMinute', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionDiariaMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionDiariaMinute', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionHour', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionHour', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionMinute', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionMinute', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionPersonalizadaHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionPersonalizadaHour', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionPersonalizadaHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionPersonalizadaHour', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionPersonalizadaMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionPersonalizadaMinute', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionPersonalizadaMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionPersonalizadaMinute', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionSemanalHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionSemanalHour', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionSemanalHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionSemanalHour', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionSemanalMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionSemanalMinute', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByHoraNotificacionSemanalMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionSemanalMinute', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByIdNotificacionProgramada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNotificacionProgramada', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByIdNotificacionProgramadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNotificacionProgramada', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByMensajeNotificacionPersonalizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeNotificacionPersonalizado', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByMensajeNotificacionPersonalizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeNotificacionPersonalizado', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByNotificacionesHabilitadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificacionesHabilitadas', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByNotificacionesHabilitadasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificacionesHabilitadas', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByRepeticiones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeticiones', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByRepeticionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeticiones', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByRepeticionesCompletadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeticionesCompletadas', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      sortByRepeticionesCompletadasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeticionesCompletadas', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> sortByValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.desc);
    });
  }
}

extension ActividadQuerySortThenBy
    on QueryBuilder<Actividad, Actividad, QSortThenBy> {
  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByDescripcion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByDescripcionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descripcion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByDiaSemanaNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diaSemanaNotificacion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByDiaSemanaNotificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diaSemanaNotificacion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByFechaNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaNotificacion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByFechaNotificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaNotificacion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByFrecuenciaNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaNotificacion', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByFrecuenciaNotificacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frecuenciaNotificacion', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionDiariaHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionDiariaHour', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionDiariaHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionDiariaHour', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionDiariaMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionDiariaMinute', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionDiariaMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionDiariaMinute', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionHour', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionHour', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionMinute', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionMinute', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionPersonalizadaHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionPersonalizadaHour', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionPersonalizadaHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionPersonalizadaHour', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionPersonalizadaMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionPersonalizadaMinute', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionPersonalizadaMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionPersonalizadaMinute', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionSemanalHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionSemanalHour', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionSemanalHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionSemanalHour', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionSemanalMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionSemanalMinute', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByHoraNotificacionSemanalMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaNotificacionSemanalMinute', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByIdNotificacionProgramada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNotificacionProgramada', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByIdNotificacionProgramadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idNotificacionProgramada', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByMensajeNotificacionPersonalizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeNotificacionPersonalizado', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByMensajeNotificacionPersonalizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mensajeNotificacionPersonalizado', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByNotificacionesHabilitadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificacionesHabilitadas', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByNotificacionesHabilitadasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificacionesHabilitadas', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByRepeticiones() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeticiones', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByRepeticionesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeticiones', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByRepeticionesCompletadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeticionesCompletadas', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy>
      thenByRepeticionesCompletadasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeticionesCompletadas', Sort.desc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.asc);
    });
  }

  QueryBuilder<Actividad, Actividad, QAfterSortBy> thenByValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.desc);
    });
  }
}

extension ActividadQueryWhereDistinct
    on QueryBuilder<Actividad, Actividad, QDistinct> {
  QueryBuilder<Actividad, Actividad, QDistinct> distinctByDescripcion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descripcion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByDiaSemanaNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diaSemanaNotificacion');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByDiasNotificacionPersonalizada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diasNotificacionPersonalizada');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct> distinctByEstado(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct> distinctByFechaNotificacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaNotificacion');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByFrecuenciaNotificacion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frecuenciaNotificacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByHoraNotificacionDiariaHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaNotificacionDiariaHour');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByHoraNotificacionDiariaMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaNotificacionDiariaMinute');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByHoraNotificacionHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaNotificacionHour');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByHoraNotificacionMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaNotificacionMinute');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByHoraNotificacionPersonalizadaHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaNotificacionPersonalizadaHour');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByHoraNotificacionPersonalizadaMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaNotificacionPersonalizadaMinute');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByHoraNotificacionSemanalHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaNotificacionSemanalHour');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByHoraNotificacionSemanalMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaNotificacionSemanalMinute');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByIdNotificacionProgramada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idNotificacionProgramada');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByMensajeNotificacionPersonalizado({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mensajeNotificacionPersonalizado',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByNotificacionesHabilitadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificacionesHabilitadas');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct> distinctByRepeticiones() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeticiones');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct>
      distinctByRepeticionesCompletadas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeticionesCompletadas');
    });
  }

  QueryBuilder<Actividad, Actividad, QDistinct> distinctByValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor');
    });
  }
}

extension ActividadQueryProperty
    on QueryBuilder<Actividad, Actividad, QQueryProperty> {
  QueryBuilder<Actividad, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Actividad, String, QQueryOperations> descripcionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descripcion');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      diaSemanaNotificacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diaSemanaNotificacion');
    });
  }

  QueryBuilder<Actividad, List<int>, QQueryOperations>
      diasNotificacionPersonalizadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diasNotificacionPersonalizada');
    });
  }

  QueryBuilder<Actividad, EstadoActividad, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Actividad, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Actividad, DateTime?, QQueryOperations>
      fechaNotificacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaNotificacion');
    });
  }

  QueryBuilder<Actividad, FrecuenciaNotificacion, QQueryOperations>
      frecuenciaNotificacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frecuenciaNotificacion');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      horaNotificacionDiariaHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaNotificacionDiariaHour');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      horaNotificacionDiariaMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaNotificacionDiariaMinute');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      horaNotificacionHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaNotificacionHour');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      horaNotificacionMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaNotificacionMinute');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      horaNotificacionPersonalizadaHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaNotificacionPersonalizadaHour');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      horaNotificacionPersonalizadaMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaNotificacionPersonalizadaMinute');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      horaNotificacionSemanalHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaNotificacionSemanalHour');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      horaNotificacionSemanalMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaNotificacionSemanalMinute');
    });
  }

  QueryBuilder<Actividad, int?, QQueryOperations>
      idNotificacionProgramadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idNotificacionProgramada');
    });
  }

  QueryBuilder<Actividad, String?, QQueryOperations>
      mensajeNotificacionPersonalizadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mensajeNotificacionPersonalizado');
    });
  }

  QueryBuilder<Actividad, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<Actividad, bool, QQueryOperations>
      notificacionesHabilitadasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificacionesHabilitadas');
    });
  }

  QueryBuilder<Actividad, int, QQueryOperations> repeticionesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeticiones');
    });
  }

  QueryBuilder<Actividad, int, QQueryOperations>
      repeticionesCompletadasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeticionesCompletadas');
    });
  }

  QueryBuilder<Actividad, int, QQueryOperations> valorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor');
    });
  }
}
