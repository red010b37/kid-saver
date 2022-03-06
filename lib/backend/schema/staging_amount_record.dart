import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'staging_amount_record.g.dart';

abstract class StagingAmountRecord
    implements Built<StagingAmountRecord, StagingAmountRecordBuilder> {
  static Serializer<StagingAmountRecord> get serializer =>
      _$stagingAmountRecordSerializer;

  @nullable
  String get state;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: 'user_account_ref')
  DocumentReference get userAccountRef;

  @nullable
  double get amount;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  DateTime get updatedAt;

  @nullable
  @BuiltValueField(wireName: 'created_by_user_account_ref')
  DocumentReference get createdByUserAccountRef;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StagingAmountRecordBuilder builder) => builder
    ..state = ''
    ..type = ''
    ..amount = 0.0
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stagingAmount');

  static Stream<StagingAmountRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StagingAmountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  StagingAmountRecord._();
  factory StagingAmountRecord(
          [void Function(StagingAmountRecordBuilder) updates]) =
      _$StagingAmountRecord;

  static StagingAmountRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStagingAmountRecordData({
  String state,
  String type,
  DocumentReference userAccountRef,
  double amount,
  DateTime createdAt,
  DateTime updatedAt,
  DocumentReference createdByUserAccountRef,
  String description,
}) =>
    serializers.toFirestore(
        StagingAmountRecord.serializer,
        StagingAmountRecord((s) => s
          ..state = state
          ..type = type
          ..userAccountRef = userAccountRef
          ..amount = amount
          ..createdAt = createdAt
          ..updatedAt = updatedAt
          ..createdByUserAccountRef = createdByUserAccountRef
          ..description = description));
