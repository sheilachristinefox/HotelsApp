// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HotelsRecord> _$hotelsRecordSerializer =
    new _$HotelsRecordSerializer();

class _$HotelsRecordSerializer implements StructuredSerializer<HotelsRecord> {
  @override
  final Iterable<Type> types = const [HotelsRecord, _$HotelsRecord];
  @override
  final String wireName = 'HotelsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, HotelsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.city;
    if (value != null) {
      result
        ..add('city')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  HotelsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HotelsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$HotelsRecord extends HotelsRecord {
  @override
  final String name;
  @override
  final String description;
  @override
  final String city;
  @override
  final double rating;
  @override
  final DocumentReference<Object> reference;

  factory _$HotelsRecord([void Function(HotelsRecordBuilder) updates]) =>
      (new HotelsRecordBuilder()..update(updates)).build();

  _$HotelsRecord._(
      {this.name, this.description, this.city, this.rating, this.reference})
      : super._();

  @override
  HotelsRecord rebuild(void Function(HotelsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HotelsRecordBuilder toBuilder() => new HotelsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HotelsRecord &&
        name == other.name &&
        description == other.description &&
        city == other.city &&
        rating == other.rating &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), description.hashCode),
                city.hashCode),
            rating.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HotelsRecord')
          ..add('name', name)
          ..add('description', description)
          ..add('city', city)
          ..add('rating', rating)
          ..add('reference', reference))
        .toString();
  }
}

class HotelsRecordBuilder
    implements Builder<HotelsRecord, HotelsRecordBuilder> {
  _$HotelsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  HotelsRecordBuilder() {
    HotelsRecord._initializeBuilder(this);
  }

  HotelsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _city = $v.city;
      _rating = $v.rating;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HotelsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HotelsRecord;
  }

  @override
  void update(void Function(HotelsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HotelsRecord build() {
    final _$result = _$v ??
        new _$HotelsRecord._(
            name: name,
            description: description,
            city: city,
            rating: rating,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
