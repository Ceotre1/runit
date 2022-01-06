import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'phone_number_record.g.dart';

abstract class PhoneNumberRecord
    implements Built<PhoneNumberRecord, PhoneNumberRecordBuilder> {
  static Serializer<PhoneNumberRecord> get serializer =>
      _$phoneNumberRecordSerializer;

  @nullable
  int get phone;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PhoneNumberRecordBuilder builder) =>
      builder..phone = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('phone_number');

  static Stream<PhoneNumberRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PhoneNumberRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PhoneNumberRecord._();
  factory PhoneNumberRecord([void Function(PhoneNumberRecordBuilder) updates]) =
      _$PhoneNumberRecord;

  static PhoneNumberRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPhoneNumberRecordData({
  int phone,
}) =>
    serializers.toFirestore(PhoneNumberRecord.serializer,
        PhoneNumberRecord((p) => p..phone = phone));
