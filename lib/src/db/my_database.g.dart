// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Veiculo extends DataClass implements Insertable<Veiculo> {
  final int id;
  final String placa;
  Veiculo({@required this.id, @required this.placa});
  factory Veiculo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Veiculo(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      placa:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}placa']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || placa != null) {
      map['placa'] = Variable<String>(placa);
    }
    return map;
  }

  VeiculosCompanion toCompanion(bool nullToAbsent) {
    return VeiculosCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      placa:
          placa == null && nullToAbsent ? const Value.absent() : Value(placa),
    );
  }

  factory Veiculo.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Veiculo(
      id: serializer.fromJson<int>(json['id']),
      placa: serializer.fromJson<String>(json['placa']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'placa': serializer.toJson<String>(placa),
    };
  }

  Veiculo copyWith({int id, String placa}) => Veiculo(
        id: id ?? this.id,
        placa: placa ?? this.placa,
      );
  @override
  String toString() {
    return (StringBuffer('Veiculo(')
          ..write('id: $id, ')
          ..write('placa: $placa')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, placa.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Veiculo && other.id == this.id && other.placa == this.placa);
}

class VeiculosCompanion extends UpdateCompanion<Veiculo> {
  final Value<int> id;
  final Value<String> placa;
  const VeiculosCompanion({
    this.id = const Value.absent(),
    this.placa = const Value.absent(),
  });
  VeiculosCompanion.insert({
    this.id = const Value.absent(),
    @required String placa,
  }) : placa = Value(placa);
  static Insertable<Veiculo> custom({
    Expression<int> id,
    Expression<String> placa,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (placa != null) 'placa': placa,
    });
  }

  VeiculosCompanion copyWith({Value<int> id, Value<String> placa}) {
    return VeiculosCompanion(
      id: id ?? this.id,
      placa: placa ?? this.placa,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (placa.present) {
      map['placa'] = Variable<String>(placa.value);
    }
    return map;
  }
}

class $VeiculosTable extends Veiculos with TableInfo<$VeiculosTable, Veiculo> {
  final GeneratedDatabase _db;
  final String _alias;
  $VeiculosTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _placaMeta = const VerificationMeta('placa');
  GeneratedTextColumn _placa;
  @override
  GeneratedTextColumn get placa => _placa ??= _constructPlaca();
  GeneratedTextColumn _constructPlaca() {
    return GeneratedTextColumn(
      'placa',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, placa];
  @override
  $VeiculosTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'veiculos';
  @override
  final String actualTableName = 'veiculos';
  @override
  VerificationContext validateIntegrity(Insertable<Veiculo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('placa')) {
      context.handle(
          _placaMeta, placa.isAcceptableOrUnknown(data['placa'], _placaMeta));
    } else if (isInserting) {
      context.missing(_placaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Veiculo map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Veiculo.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $VeiculosTable createAlias(String alias) {
    return $VeiculosTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $VeiculosTable _veiculos;
  $VeiculosTable get veiculos => _veiculos ??= $VeiculosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [veiculos];
}
