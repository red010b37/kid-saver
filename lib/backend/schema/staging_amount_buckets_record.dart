import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'staging_amount_buckets_record.g.dart';

abstract class StagingAmountBucketsRecord
    implements
        Built<StagingAmountBucketsRecord, StagingAmountBucketsRecordBuilder> {
  static Serializer<StagingAmountBucketsRecord> get serializer =>
      _$stagingAmountBucketsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'bucket_ref')
  DocumentReference get bucketRef;

  @nullable
  @BuiltValueField(wireName: 'is_selected')
  bool get isSelected;

  @nullable
  @BuiltValueField(wireName: 'staging_amount_ref')
  DocumentReference get stagingAmountRef;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  DateTime get updatedAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StagingAmountBucketsRecordBuilder builder) =>
      builder..isSelected = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stagingAmountBuckets');

  static Stream<StagingAmountBucketsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<StagingAmountBucketsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  StagingAmountBucketsRecord._();
  factory StagingAmountBucketsRecord(
          [void Function(StagingAmountBucketsRecordBuilder) updates]) =
      _$StagingAmountBucketsRecord;

  static StagingAmountBucketsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createStagingAmountBucketsRecordData({
  DocumentReference bucketRef,
  bool isSelected,
  DocumentReference stagingAmountRef,
  DateTime createdAt,
  DateTime updatedAt,
}) =>
    serializers.toFirestore(
        StagingAmountBucketsRecord.serializer,
        StagingAmountBucketsRecord((s) => s
          ..bucketRef = bucketRef
          ..isSelected = isSelected
          ..stagingAmountRef = stagingAmountRef
          ..createdAt = createdAt
          ..updatedAt = updatedAt));
