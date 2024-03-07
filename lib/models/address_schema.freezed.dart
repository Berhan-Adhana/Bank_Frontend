// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressSchema {
  Field<String> get email => throw _privateConstructorUsedError;
  Field<String> get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressSchemaCopyWith<AddressSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressSchemaCopyWith<$Res> {
  factory $AddressSchemaCopyWith(
          AddressSchema value, $Res Function(AddressSchema) then) =
      _$AddressSchemaCopyWithImpl<$Res, AddressSchema>;
  @useResult
  $Res call({Field<String> email, Field<String> password});

  $FieldCopyWith<String, $Res> get email;
  $FieldCopyWith<String, $Res> get password;
}

/// @nodoc
class _$AddressSchemaCopyWithImpl<$Res, $Val extends AddressSchema>
    implements $AddressSchemaCopyWith<$Res> {
  _$AddressSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get email {
    return $FieldCopyWith<String, $Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldCopyWith<String, $Res> get password {
    return $FieldCopyWith<String, $Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressSchemaImplCopyWith<$Res>
    implements $AddressSchemaCopyWith<$Res> {
  factory _$$AddressSchemaImplCopyWith(
          _$AddressSchemaImpl value, $Res Function(_$AddressSchemaImpl) then) =
      __$$AddressSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Field<String> email, Field<String> password});

  @override
  $FieldCopyWith<String, $Res> get email;
  @override
  $FieldCopyWith<String, $Res> get password;
}

/// @nodoc
class __$$AddressSchemaImplCopyWithImpl<$Res>
    extends _$AddressSchemaCopyWithImpl<$Res, _$AddressSchemaImpl>
    implements _$$AddressSchemaImplCopyWith<$Res> {
  __$$AddressSchemaImplCopyWithImpl(
      _$AddressSchemaImpl _value, $Res Function(_$AddressSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AddressSchemaImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Field<String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Field<String>,
    ));
  }
}

/// @nodoc

class _$AddressSchemaImpl implements _AddressSchema {
  const _$AddressSchemaImpl({required this.email, required this.password});

  @override
  final Field<String> email;
  @override
  final Field<String> password;

  @override
  String toString() {
    return 'AddressSchema(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressSchemaImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressSchemaImplCopyWith<_$AddressSchemaImpl> get copyWith =>
      __$$AddressSchemaImplCopyWithImpl<_$AddressSchemaImpl>(this, _$identity);
}

abstract class _AddressSchema implements AddressSchema {
  const factory _AddressSchema(
      {required final Field<String> email,
      required final Field<String> password}) = _$AddressSchemaImpl;

  @override
  Field<String> get email;
  @override
  Field<String> get password;
  @override
  @JsonKey(ignore: true)
  _$$AddressSchemaImplCopyWith<_$AddressSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
