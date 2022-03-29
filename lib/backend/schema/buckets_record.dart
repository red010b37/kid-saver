import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'buckets_record.g.dart';

abstract class BucketsRecord
    implements Built<BucketsRecord, BucketsRecordBuilder> {
  static Serializer<BucketsRecord> get serializer => _$bucketsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_account_ref')
  DocumentReference get userAccountRef;

  @nullable
  String get name;

  @nullable
  String get state;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  DateTime get updatedAt;

  @nullable
  @BuiltValueField(wireName: 'can_user_delete')
  bool get canUserDelete;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'account_ref')
  DocumentReference get accountRef;

  @nullable
  @BuiltValueField(wireName: 'last_seen_total_cents')
  int get lastSeenTotalCents;

  @nullable
  @BuiltValueField(wireName: 'total_cents')
  int get totalCents;

  @nullable
  String get type;

  @nullable
  String get color;

  @nullable
  @BuiltValueField(wireName: 'goal_amount_cents')
  int get goalAmountCents;

  @nullable
  @BuiltValueField(wireName: 'interest_per_annum_percent')
  double get interestPerAnnumPercent;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BucketsRecordBuilder builder) => builder
    ..name = ''
    ..state = ''
    ..canUserDelete = false
    ..description = ''
    ..lastSeenTotalCents = 0
    ..totalCents = 0
    ..type = ''
    ..color = ''
    ..goalAmountCents = 0
    ..interestPerAnnumPercent = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('buckets');

  static Stream<BucketsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BucketsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BucketsRecord._();
  factory BucketsRecord([void Function(BucketsRecordBuilder) updates]) =
      _$BucketsRecord;

  static BucketsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBucketsRecordData({
  DocumentReference userAccountRef,
  String name,
  String state,
  DateTime createdAt,
  DateTime updatedAt,
  bool canUserDelete,
  String description,
  DocumentReference accountRef,
  int lastSeenTotalCents,
  int totalCents,
  String type,
  String color,
  int goalAmountCents,
  double interestPerAnnumPercent,
}) =>
    serializers.toFirestore(
        BucketsRecord.serializer,
        BucketsRecord((b) => b
          ..userAccountRef = userAccountRef
          ..name = name
          ..state = state
          ..createdAt = createdAt
          ..updatedAt = updatedAt
          ..canUserDelete = canUserDelete
          ..description = description
          ..accountRef = accountRef
          ..lastSeenTotalCents = lastSeenTotalCents
          ..totalCents = totalCents
          ..type = type
          ..color = color
          ..goalAmountCents = goalAmountCents
          ..interestPerAnnumPercent = interestPerAnnumPercent));
