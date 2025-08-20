// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semana.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSemanaCollection on Isar {
  IsarCollection<Semana> get semanas => this.collection();
}

const SemanaSchema = CollectionSchema(
  name: r'Semana',
  id: -5512264519869203844,
  properties: {
    r'estado': PropertySchema(
      id: 0,
      name: r'estado',
      type: IsarType.bool,
    ),
    r'fechaCreacion': PropertySchema(
      id: 1,
      name: r'fechaCreacion',
      type: IsarType.dateTime,
    ),
    r'fechaFin': PropertySchema(
      id: 2,
      name: r'fechaFin',
      type: IsarType.dateTime,
    ),
    r'fechaInicio': PropertySchema(
      id: 3,
      name: r'fechaInicio',
      type: IsarType.dateTime,
    ),
    r'numeroSemana': PropertySchema(
      id: 4,
      name: r'numeroSemana',
      type: IsarType.long,
    )
  },
  estimateSize: _semanaEstimateSize,
  serialize: _semanaSerialize,
  deserialize: _semanaDeserialize,
  deserializeProp: _semanaDeserializeProp,
  idName: r'id',
  indexes: {
    r'fechaInicio': IndexSchema(
      id: -8943925949262073739,
      name: r'fechaInicio',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fechaInicio',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'fechaFin': IndexSchema(
      id: -5669079726680897074,
      name: r'fechaFin',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fechaFin',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'actividades': LinkSchema(
      id: 5805475104643108684,
      name: r'actividades',
      target: r'Actividad',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _semanaGetId,
  getLinks: _semanaGetLinks,
  attach: _semanaAttach,
  version: '3.1.0+1',
);

int _semanaEstimateSize(
  Semana object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _semanaSerialize(
  Semana object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.estado);
  writer.writeDateTime(offsets[1], object.fechaCreacion);
  writer.writeDateTime(offsets[2], object.fechaFin);
  writer.writeDateTime(offsets[3], object.fechaInicio);
  writer.writeLong(offsets[4], object.numeroSemana);
}

Semana _semanaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Semana();
  object.estado = reader.readBool(offsets[0]);
  object.fechaCreacion = reader.readDateTime(offsets[1]);
  object.fechaFin = reader.readDateTime(offsets[2]);
  object.fechaInicio = reader.readDateTime(offsets[3]);
  object.id = id;
  return object;
}

P _semanaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _semanaGetId(Semana object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _semanaGetLinks(Semana object) {
  return [object.actividades];
}

void _semanaAttach(IsarCollection<dynamic> col, Id id, Semana object) {
  object.id = id;
  object.actividades
      .attach(col, col.isar.collection<Actividad>(), r'actividades', id);
}

extension SemanaQueryWhereSort on QueryBuilder<Semana, Semana, QWhere> {
  QueryBuilder<Semana, Semana, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhere> anyFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fechaInicio'),
      );
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhere> anyFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fechaFin'),
      );
    });
  }
}

extension SemanaQueryWhere on QueryBuilder<Semana, Semana, QWhereClause> {
  QueryBuilder<Semana, Semana, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Semana, Semana, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> idBetween(
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

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaInicioEqualTo(
      DateTime fechaInicio) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fechaInicio',
        value: [fechaInicio],
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaInicioNotEqualTo(
      DateTime fechaInicio) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaInicio',
              lower: [],
              upper: [fechaInicio],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaInicio',
              lower: [fechaInicio],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaInicio',
              lower: [fechaInicio],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaInicio',
              lower: [],
              upper: [fechaInicio],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaInicioGreaterThan(
    DateTime fechaInicio, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaInicio',
        lower: [fechaInicio],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaInicioLessThan(
    DateTime fechaInicio, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaInicio',
        lower: [],
        upper: [fechaInicio],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaInicioBetween(
    DateTime lowerFechaInicio,
    DateTime upperFechaInicio, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaInicio',
        lower: [lowerFechaInicio],
        includeLower: includeLower,
        upper: [upperFechaInicio],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaFinEqualTo(
      DateTime fechaFin) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fechaFin',
        value: [fechaFin],
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaFinNotEqualTo(
      DateTime fechaFin) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaFin',
              lower: [],
              upper: [fechaFin],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaFin',
              lower: [fechaFin],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaFin',
              lower: [fechaFin],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaFin',
              lower: [],
              upper: [fechaFin],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaFinGreaterThan(
    DateTime fechaFin, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaFin',
        lower: [fechaFin],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaFinLessThan(
    DateTime fechaFin, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaFin',
        lower: [],
        upper: [fechaFin],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterWhereClause> fechaFinBetween(
    DateTime lowerFechaFin,
    DateTime upperFechaFin, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaFin',
        lower: [lowerFechaFin],
        includeLower: includeLower,
        upper: [upperFechaFin],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SemanaQueryFilter on QueryBuilder<Semana, Semana, QFilterCondition> {
  QueryBuilder<Semana, Semana, QAfterFilterCondition> estadoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estado',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaCreacionEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaCreacionGreaterThan(
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

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaCreacionLessThan(
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

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaCreacionBetween(
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

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaFinEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaFinGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaFinLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaFin',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaFinBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaFin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaInicioEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaInicioGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaInicioLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaInicio',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> fechaInicioBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Semana, Semana, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Semana, Semana, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Semana, Semana, QAfterFilterCondition> numeroSemanaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numeroSemana',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> numeroSemanaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numeroSemana',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> numeroSemanaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numeroSemana',
        value: value,
      ));
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> numeroSemanaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numeroSemana',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SemanaQueryObject on QueryBuilder<Semana, Semana, QFilterCondition> {}

extension SemanaQueryLinks on QueryBuilder<Semana, Semana, QFilterCondition> {
  QueryBuilder<Semana, Semana, QAfterFilterCondition> actividades(
      FilterQuery<Actividad> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'actividades');
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> actividadesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'actividades', length, true, length, true);
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> actividadesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'actividades', 0, true, 0, true);
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> actividadesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'actividades', 0, false, 999999, true);
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> actividadesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'actividades', 0, true, length, include);
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition>
      actividadesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'actividades', length, include, 999999, true);
    });
  }

  QueryBuilder<Semana, Semana, QAfterFilterCondition> actividadesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'actividades', lower, includeLower, upper, includeUpper);
    });
  }
}

extension SemanaQuerySortBy on QueryBuilder<Semana, Semana, QSortBy> {
  QueryBuilder<Semana, Semana, QAfterSortBy> sortByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByNumeroSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroSemana', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> sortByNumeroSemanaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroSemana', Sort.desc);
    });
  }
}

extension SemanaQuerySortThenBy on QueryBuilder<Semana, Semana, QSortThenBy> {
  QueryBuilder<Semana, Semana, QAfterSortBy> thenByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByEstadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estado', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByFechaFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaFin', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByFechaInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaInicio', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByNumeroSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroSemana', Sort.asc);
    });
  }

  QueryBuilder<Semana, Semana, QAfterSortBy> thenByNumeroSemanaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numeroSemana', Sort.desc);
    });
  }
}

extension SemanaQueryWhereDistinct on QueryBuilder<Semana, Semana, QDistinct> {
  QueryBuilder<Semana, Semana, QDistinct> distinctByEstado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estado');
    });
  }

  QueryBuilder<Semana, Semana, QDistinct> distinctByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion');
    });
  }

  QueryBuilder<Semana, Semana, QDistinct> distinctByFechaFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaFin');
    });
  }

  QueryBuilder<Semana, Semana, QDistinct> distinctByFechaInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaInicio');
    });
  }

  QueryBuilder<Semana, Semana, QDistinct> distinctByNumeroSemana() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numeroSemana');
    });
  }
}

extension SemanaQueryProperty on QueryBuilder<Semana, Semana, QQueryProperty> {
  QueryBuilder<Semana, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Semana, bool, QQueryOperations> estadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estado');
    });
  }

  QueryBuilder<Semana, DateTime, QQueryOperations> fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<Semana, DateTime, QQueryOperations> fechaFinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaFin');
    });
  }

  QueryBuilder<Semana, DateTime, QQueryOperations> fechaInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaInicio');
    });
  }

  QueryBuilder<Semana, int, QQueryOperations> numeroSemanaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numeroSemana');
    });
  }
}
