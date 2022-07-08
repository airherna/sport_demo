// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class RoutineEntity extends DataClass implements Insertable<RoutineEntity> {
  final int id;
  final String name;
  final bool active;
  RoutineEntity({required this.id, required this.name, required this.active});
  factory RoutineEntity.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RoutineEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      active: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}active'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<bool>(active);
    return map;
  }

  RoutinesCompanion toCompanion(bool nullToAbsent) {
    return RoutinesCompanion(
      id: Value(id),
      name: Value(name),
      active: Value(active),
    );
  }

  factory RoutineEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<bool>(active),
    };
  }

  RoutineEntity copyWith({int? id, String? name, bool? active}) =>
      RoutineEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
      );
  @override
  String toString() {
    return (StringBuffer('RoutineEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.active == this.active);
}

class RoutinesCompanion extends UpdateCompanion<RoutineEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> active;
  const RoutinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
  });
  RoutinesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool active,
  })  : name = Value(name),
        active = Value(active);
  static Insertable<RoutineEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
    });
  }

  RoutinesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<bool>? active}) {
    return RoutinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $RoutinesTable extends Routines
    with TableInfo<$RoutinesTable, RoutineEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutinesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool?> active = GeneratedColumn<bool?>(
      'active', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (active IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [id, name, active];
  @override
  String get aliasedName => _alias ?? 'routines';
  @override
  String get actualTableName => 'routines';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoutineEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RoutineEntity.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoutinesTable createAlias(String alias) {
    return $RoutinesTable(attachedDatabase, alias);
  }
}

class DayEntity extends DataClass implements Insertable<DayEntity> {
  final int id;
  final String name;
  final String daysOfWeek;
  DayEntity({required this.id, required this.name, required this.daysOfWeek});
  factory DayEntity.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DayEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      daysOfWeek: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}days_of_week'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['days_of_week'] = Variable<String>(daysOfWeek);
    return map;
  }

  DaysCompanion toCompanion(bool nullToAbsent) {
    return DaysCompanion(
      id: Value(id),
      name: Value(name),
      daysOfWeek: Value(daysOfWeek),
    );
  }

  factory DayEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      daysOfWeek: serializer.fromJson<String>(json['daysOfWeek']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'daysOfWeek': serializer.toJson<String>(daysOfWeek),
    };
  }

  DayEntity copyWith({int? id, String? name, String? daysOfWeek}) => DayEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      );
  @override
  String toString() {
    return (StringBuffer('DayEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('daysOfWeek: $daysOfWeek')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, daysOfWeek);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.daysOfWeek == this.daysOfWeek);
}

class DaysCompanion extends UpdateCompanion<DayEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> daysOfWeek;
  const DaysCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.daysOfWeek = const Value.absent(),
  });
  DaysCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String daysOfWeek,
  })  : name = Value(name),
        daysOfWeek = Value(daysOfWeek);
  static Insertable<DayEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? daysOfWeek,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (daysOfWeek != null) 'days_of_week': daysOfWeek,
    });
  }

  DaysCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? daysOfWeek}) {
    return DaysCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (daysOfWeek.present) {
      map['days_of_week'] = Variable<String>(daysOfWeek.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DaysCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('daysOfWeek: $daysOfWeek')
          ..write(')'))
        .toString();
  }
}

class $DaysTable extends Days with TableInfo<$DaysTable, DayEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DaysTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _daysOfWeekMeta = const VerificationMeta('daysOfWeek');
  @override
  late final GeneratedColumn<String?> daysOfWeek = GeneratedColumn<String?>(
      'days_of_week', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, daysOfWeek];
  @override
  String get aliasedName => _alias ?? 'days';
  @override
  String get actualTableName => 'days';
  @override
  VerificationContext validateIntegrity(Insertable<DayEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('days_of_week')) {
      context.handle(
          _daysOfWeekMeta,
          daysOfWeek.isAcceptableOrUnknown(
              data['days_of_week']!, _daysOfWeekMeta));
    } else if (isInserting) {
      context.missing(_daysOfWeekMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DayEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DayEntity.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DaysTable createAlias(String alias) {
    return $DaysTable(attachedDatabase, alias);
  }
}

class RoutineDay extends DataClass implements Insertable<RoutineDay> {
  final int routineId;
  final int dayId;
  RoutineDay({required this.routineId, required this.dayId});
  factory RoutineDay.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RoutineDay(
      routineId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}routine_id'])!,
      dayId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}day_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['routine_id'] = Variable<int>(routineId);
    map['day_id'] = Variable<int>(dayId);
    return map;
  }

  RoutineDaysCompanion toCompanion(bool nullToAbsent) {
    return RoutineDaysCompanion(
      routineId: Value(routineId),
      dayId: Value(dayId),
    );
  }

  factory RoutineDay.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoutineDay(
      routineId: serializer.fromJson<int>(json['routineId']),
      dayId: serializer.fromJson<int>(json['dayId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routineId': serializer.toJson<int>(routineId),
      'dayId': serializer.toJson<int>(dayId),
    };
  }

  RoutineDay copyWith({int? routineId, int? dayId}) => RoutineDay(
        routineId: routineId ?? this.routineId,
        dayId: dayId ?? this.dayId,
      );
  @override
  String toString() {
    return (StringBuffer('RoutineDay(')
          ..write('routineId: $routineId, ')
          ..write('dayId: $dayId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(routineId, dayId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoutineDay &&
          other.routineId == this.routineId &&
          other.dayId == this.dayId);
}

class RoutineDaysCompanion extends UpdateCompanion<RoutineDay> {
  final Value<int> routineId;
  final Value<int> dayId;
  const RoutineDaysCompanion({
    this.routineId = const Value.absent(),
    this.dayId = const Value.absent(),
  });
  RoutineDaysCompanion.insert({
    required int routineId,
    required int dayId,
  })  : routineId = Value(routineId),
        dayId = Value(dayId);
  static Insertable<RoutineDay> custom({
    Expression<int>? routineId,
    Expression<int>? dayId,
  }) {
    return RawValuesInsertable({
      if (routineId != null) 'routine_id': routineId,
      if (dayId != null) 'day_id': dayId,
    });
  }

  RoutineDaysCompanion copyWith({Value<int>? routineId, Value<int>? dayId}) {
    return RoutineDaysCompanion(
      routineId: routineId ?? this.routineId,
      dayId: dayId ?? this.dayId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routineId.present) {
      map['routine_id'] = Variable<int>(routineId.value);
    }
    if (dayId.present) {
      map['day_id'] = Variable<int>(dayId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoutineDaysCompanion(')
          ..write('routineId: $routineId, ')
          ..write('dayId: $dayId')
          ..write(')'))
        .toString();
  }
}

class $RoutineDaysTable extends RoutineDays
    with TableInfo<$RoutineDaysTable, RoutineDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoutineDaysTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _routineIdMeta = const VerificationMeta('routineId');
  @override
  late final GeneratedColumn<int?> routineId = GeneratedColumn<int?>(
      'routine_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES routines (id)');
  final VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int?> dayId = GeneratedColumn<int?>(
      'day_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES days (id)');
  @override
  List<GeneratedColumn> get $columns => [routineId, dayId];
  @override
  String get aliasedName => _alias ?? 'routine_days';
  @override
  String get actualTableName => 'routine_days';
  @override
  VerificationContext validateIntegrity(Insertable<RoutineDay> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('routine_id')) {
      context.handle(_routineIdMeta,
          routineId.isAcceptableOrUnknown(data['routine_id']!, _routineIdMeta));
    } else if (isInserting) {
      context.missing(_routineIdMeta);
    }
    if (data.containsKey('day_id')) {
      context.handle(
          _dayIdMeta, dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta));
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routineId, dayId};
  @override
  RoutineDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RoutineDay.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoutineDaysTable createAlias(String alias) {
    return $RoutineDaysTable(attachedDatabase, alias);
  }
}

class ExerciseEntity extends DataClass implements Insertable<ExerciseEntity> {
  final int id;
  final String name;
  final int sets;
  final int repetitions;
  final double weight;
  ExerciseEntity(
      {required this.id,
      required this.name,
      required this.sets,
      required this.repetitions,
      required this.weight});
  factory ExerciseEntity.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ExerciseEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      sets: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sets'])!,
      repetitions: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}repetitions'])!,
      weight: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sets'] = Variable<int>(sets);
    map['repetitions'] = Variable<int>(repetitions);
    map['weight'] = Variable<double>(weight);
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: Value(id),
      name: Value(name),
      sets: Value(sets),
      repetitions: Value(repetitions),
      weight: Value(weight),
    );
  }

  factory ExerciseEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExerciseEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      sets: serializer.fromJson<int>(json['sets']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
      weight: serializer.fromJson<double>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'sets': serializer.toJson<int>(sets),
      'repetitions': serializer.toJson<int>(repetitions),
      'weight': serializer.toJson<double>(weight),
    };
  }

  ExerciseEntity copyWith(
          {int? id,
          String? name,
          int? sets,
          int? repetitions,
          double? weight}) =>
      ExerciseEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        sets: sets ?? this.sets,
        repetitions: repetitions ?? this.repetitions,
        weight: weight ?? this.weight,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sets: $sets, ')
          ..write('repetitions: $repetitions, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, sets, repetitions, weight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExerciseEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.sets == this.sets &&
          other.repetitions == this.repetitions &&
          other.weight == this.weight);
}

class ExercisesCompanion extends UpdateCompanion<ExerciseEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> sets;
  final Value<int> repetitions;
  final Value<double> weight;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.sets = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.weight = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int sets,
    required int repetitions,
    required double weight,
  })  : name = Value(name),
        sets = Value(sets),
        repetitions = Value(repetitions),
        weight = Value(weight);
  static Insertable<ExerciseEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? sets,
    Expression<int>? repetitions,
    Expression<double>? weight,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (sets != null) 'sets': sets,
      if (repetitions != null) 'repetitions': repetitions,
      if (weight != null) 'weight': weight,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? sets,
      Value<int>? repetitions,
      Value<double>? weight}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      sets: sets ?? this.sets,
      repetitions: repetitions ?? this.repetitions,
      weight: weight ?? this.weight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (sets.present) {
      map['sets'] = Variable<int>(sets.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExercisesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('sets: $sets, ')
          ..write('repetitions: $repetitions, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, ExerciseEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExercisesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _setsMeta = const VerificationMeta('sets');
  @override
  late final GeneratedColumn<int?> sets = GeneratedColumn<int?>(
      'sets', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<int?> repetitions = GeneratedColumn<int?>(
      'repetitions', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double?> weight = GeneratedColumn<double?>(
      'weight', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, sets, repetitions, weight];
  @override
  String get aliasedName => _alias ?? 'exercises';
  @override
  String get actualTableName => 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sets')) {
      context.handle(
          _setsMeta, sets.isAcceptableOrUnknown(data['sets']!, _setsMeta));
    } else if (isInserting) {
      context.missing(_setsMeta);
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    } else if (isInserting) {
      context.missing(_repetitionsMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ExerciseEntity.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(attachedDatabase, alias);
  }
}

class DayExercise extends DataClass implements Insertable<DayExercise> {
  final int dayId;
  final int exerciseId;
  DayExercise({required this.dayId, required this.exerciseId});
  factory DayExercise.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DayExercise(
      dayId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}day_id'])!,
      exerciseId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day_id'] = Variable<int>(dayId);
    map['exercise_id'] = Variable<int>(exerciseId);
    return map;
  }

  DayExercisesCompanion toCompanion(bool nullToAbsent) {
    return DayExercisesCompanion(
      dayId: Value(dayId),
      exerciseId: Value(exerciseId),
    );
  }

  factory DayExercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DayExercise(
      dayId: serializer.fromJson<int>(json['dayId']),
      exerciseId: serializer.fromJson<int>(json['exerciseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dayId': serializer.toJson<int>(dayId),
      'exerciseId': serializer.toJson<int>(exerciseId),
    };
  }

  DayExercise copyWith({int? dayId, int? exerciseId}) => DayExercise(
        dayId: dayId ?? this.dayId,
        exerciseId: exerciseId ?? this.exerciseId,
      );
  @override
  String toString() {
    return (StringBuffer('DayExercise(')
          ..write('dayId: $dayId, ')
          ..write('exerciseId: $exerciseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dayId, exerciseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DayExercise &&
          other.dayId == this.dayId &&
          other.exerciseId == this.exerciseId);
}

class DayExercisesCompanion extends UpdateCompanion<DayExercise> {
  final Value<int> dayId;
  final Value<int> exerciseId;
  const DayExercisesCompanion({
    this.dayId = const Value.absent(),
    this.exerciseId = const Value.absent(),
  });
  DayExercisesCompanion.insert({
    required int dayId,
    required int exerciseId,
  })  : dayId = Value(dayId),
        exerciseId = Value(exerciseId);
  static Insertable<DayExercise> custom({
    Expression<int>? dayId,
    Expression<int>? exerciseId,
  }) {
    return RawValuesInsertable({
      if (dayId != null) 'day_id': dayId,
      if (exerciseId != null) 'exercise_id': exerciseId,
    });
  }

  DayExercisesCompanion copyWith({Value<int>? dayId, Value<int>? exerciseId}) {
    return DayExercisesCompanion(
      dayId: dayId ?? this.dayId,
      exerciseId: exerciseId ?? this.exerciseId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dayId.present) {
      map['day_id'] = Variable<int>(dayId.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<int>(exerciseId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DayExercisesCompanion(')
          ..write('dayId: $dayId, ')
          ..write('exerciseId: $exerciseId')
          ..write(')'))
        .toString();
  }
}

class $DayExercisesTable extends DayExercises
    with TableInfo<$DayExercisesTable, DayExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DayExercisesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _dayIdMeta = const VerificationMeta('dayId');
  @override
  late final GeneratedColumn<int?> dayId = GeneratedColumn<int?>(
      'day_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES days (id)');
  final VerificationMeta _exerciseIdMeta = const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<int?> exerciseId = GeneratedColumn<int?>(
      'exercise_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES exercises (id)');
  @override
  List<GeneratedColumn> get $columns => [dayId, exerciseId];
  @override
  String get aliasedName => _alias ?? 'day_exercises';
  @override
  String get actualTableName => 'day_exercises';
  @override
  VerificationContext validateIntegrity(Insertable<DayExercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('day_id')) {
      context.handle(
          _dayIdMeta, dayId.isAcceptableOrUnknown(data['day_id']!, _dayIdMeta));
    } else if (isInserting) {
      context.missing(_dayIdMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dayId, exerciseId};
  @override
  DayExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DayExercise.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DayExercisesTable createAlias(String alias) {
    return $DayExercisesTable(attachedDatabase, alias);
  }
}

class UserEntity extends DataClass implements Insertable<UserEntity> {
  final int id;
  final double objectiveWeight;
  UserEntity({required this.id, required this.objectiveWeight});
  factory UserEntity.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectiveWeight: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}objective_weight'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['objective_weight'] = Variable<double>(objectiveWeight);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      objectiveWeight: Value(objectiveWeight),
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntity(
      id: serializer.fromJson<int>(json['id']),
      objectiveWeight: serializer.fromJson<double>(json['objectiveWeight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectiveWeight': serializer.toJson<double>(objectiveWeight),
    };
  }

  UserEntity copyWith({int? id, double? objectiveWeight}) => UserEntity(
        id: id ?? this.id,
        objectiveWeight: objectiveWeight ?? this.objectiveWeight,
      );
  @override
  String toString() {
    return (StringBuffer('UserEntity(')
          ..write('id: $id, ')
          ..write('objectiveWeight: $objectiveWeight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectiveWeight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          other.id == this.id &&
          other.objectiveWeight == this.objectiveWeight);
}

class UsersCompanion extends UpdateCompanion<UserEntity> {
  final Value<int> id;
  final Value<double> objectiveWeight;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.objectiveWeight = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required double objectiveWeight,
  }) : objectiveWeight = Value(objectiveWeight);
  static Insertable<UserEntity> custom({
    Expression<int>? id,
    Expression<double>? objectiveWeight,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectiveWeight != null) 'objective_weight': objectiveWeight,
    });
  }

  UsersCompanion copyWith({Value<int>? id, Value<double>? objectiveWeight}) {
    return UsersCompanion(
      id: id ?? this.id,
      objectiveWeight: objectiveWeight ?? this.objectiveWeight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectiveWeight.present) {
      map['objective_weight'] = Variable<double>(objectiveWeight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('objectiveWeight: $objectiveWeight')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectiveWeightMeta =
      const VerificationMeta('objectiveWeight');
  @override
  late final GeneratedColumn<double?> objectiveWeight =
      GeneratedColumn<double?>('objective_weight', aliasedName, false,
          type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, objectiveWeight];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('objective_weight')) {
      context.handle(
          _objectiveWeightMeta,
          objectiveWeight.isAcceptableOrUnknown(
              data['objective_weight']!, _objectiveWeightMeta));
    } else if (isInserting) {
      context.missing(_objectiveWeightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserEntity.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class BodyWeightEntity extends DataClass
    implements Insertable<BodyWeightEntity> {
  final int id;
  final double weight;
  final int userId;
  final DateTime date;
  BodyWeightEntity(
      {required this.id,
      required this.weight,
      required this.userId,
      required this.date});
  factory BodyWeightEntity.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BodyWeightEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      weight: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['weight'] = Variable<double>(weight);
    map['user_id'] = Variable<int>(userId);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  BodyWeightsCompanion toCompanion(bool nullToAbsent) {
    return BodyWeightsCompanion(
      id: Value(id),
      weight: Value(weight),
      userId: Value(userId),
      date: Value(date),
    );
  }

  factory BodyWeightEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyWeightEntity(
      id: serializer.fromJson<int>(json['id']),
      weight: serializer.fromJson<double>(json['weight']),
      userId: serializer.fromJson<int>(json['userId']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weight': serializer.toJson<double>(weight),
      'userId': serializer.toJson<int>(userId),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  BodyWeightEntity copyWith(
          {int? id, double? weight, int? userId, DateTime? date}) =>
      BodyWeightEntity(
        id: id ?? this.id,
        weight: weight ?? this.weight,
        userId: userId ?? this.userId,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('BodyWeightEntity(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('userId: $userId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, weight, userId, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyWeightEntity &&
          other.id == this.id &&
          other.weight == this.weight &&
          other.userId == this.userId &&
          other.date == this.date);
}

class BodyWeightsCompanion extends UpdateCompanion<BodyWeightEntity> {
  final Value<int> id;
  final Value<double> weight;
  final Value<int> userId;
  final Value<DateTime> date;
  const BodyWeightsCompanion({
    this.id = const Value.absent(),
    this.weight = const Value.absent(),
    this.userId = const Value.absent(),
    this.date = const Value.absent(),
  });
  BodyWeightsCompanion.insert({
    this.id = const Value.absent(),
    required double weight,
    required int userId,
    required DateTime date,
  })  : weight = Value(weight),
        userId = Value(userId),
        date = Value(date);
  static Insertable<BodyWeightEntity> custom({
    Expression<int>? id,
    Expression<double>? weight,
    Expression<int>? userId,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weight != null) 'weight': weight,
      if (userId != null) 'user_id': userId,
      if (date != null) 'date': date,
    });
  }

  BodyWeightsCompanion copyWith(
      {Value<int>? id,
      Value<double>? weight,
      Value<int>? userId,
      Value<DateTime>? date}) {
    return BodyWeightsCompanion(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      userId: userId ?? this.userId,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyWeightsCompanion(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('userId: $userId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $BodyWeightsTable extends BodyWeights
    with TableInfo<$BodyWeightsTable, BodyWeightEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyWeightsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double?> weight = GeneratedColumn<double?>(
      'weight', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'user_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, weight, userId, date];
  @override
  String get aliasedName => _alias ?? 'body_weights';
  @override
  String get actualTableName => 'body_weights';
  @override
  VerificationContext validateIntegrity(Insertable<BodyWeightEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BodyWeightEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BodyWeightEntity.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BodyWeightsTable createAlias(String alias) {
    return $BodyWeightsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $RoutinesTable routines = $RoutinesTable(this);
  late final $DaysTable days = $DaysTable(this);
  late final $RoutineDaysTable routineDays = $RoutineDaysTable(this);
  late final $ExercisesTable exercises = $ExercisesTable(this);
  late final $DayExercisesTable dayExercises = $DayExercisesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $BodyWeightsTable bodyWeights = $BodyWeightsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        routines,
        days,
        routineDays,
        exercises,
        dayExercises,
        users,
        bodyWeights
      ];
}
