import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front_end/models/field.dart';

part "address_schema.freezed.dart";

@freezed
class AddressSchema with _$AddressSchema {
  const factory AddressSchema({
    required Field<String> email,
    required Field<String> password,
  }) = _AddressSchema;

  factory AddressSchema.empty() =>
        AddressSchema(email: Field(value: ''), password: Field(value: ''));
}
