import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transaction_record.g.dart';

abstract class TransactionRecord
    implements Built<TransactionRecord, TransactionRecordBuilder> {
  static Serializer<TransactionRecord> get serializer =>
      _$transactionRecordSerializer;

  @nullable
  String get type;

  @nullable
  @BuiltValueField(wireName: 'amount_cents')
  int get amountCents;

  @nullable
  @BuiltValueField(wireName: 'creator_user_account_ref')
  DocumentReference get creatorUserAccountRef;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  DateTime get updatedAt;

  @nullable
  @BuiltValueField(wireName: 'bucket_ref')
  DocumentReference get bucketRef;

  @nullable
  @BuiltValueField(wireName: 'assigned_user_account_ref')
  DocumentReference get assignedUserAccountRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TransactionRecordBuilder builder) => builder
    ..type = ''
    ..amountCents = 0
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction');

  static Stream<TransactionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TransactionRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TransactionRecord._();
  factory TransactionRecord([void Function(TransactionRecordBuilder) updates]) =
      _$TransactionRecord;

  static TransactionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTransactionRecordData({
  String type,
  int amountCents,
  DocumentReference creatorUserAccountRef,
  String description,
  DateTime createdAt,
  DateTime updatedAt,
  DocumentReference bucketRef,
  DocumentReference assignedUserAccountRef,
}) =>
    serializers.toFirestore(
        TransactionRecord.serializer,
        TransactionRecord((t) => t
          ..type = type
          ..amountCents = amountCents
          ..creatorUserAccountRef = creatorUserAccountRef
          ..description = description
          ..createdAt = createdAt
          ..updatedAt = updatedAt
          ..bucketRef = bucketRef
          ..assignedUserAccountRef = assignedUserAccountRef));
