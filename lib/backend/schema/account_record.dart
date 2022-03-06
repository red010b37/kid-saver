import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'account_record.g.dart';

abstract class AccountRecord
    implements Built<AccountRecord, AccountRecordBuilder> {
  static Serializer<AccountRecord> get serializer => _$accountRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'owner_ref')
  DocumentReference get ownerRef;

  @nullable
  String get state;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  DateTime get updatedAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AccountRecordBuilder builder) =>
      builder..state = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('account');

  static Stream<AccountRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AccountRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AccountRecord._();
  factory AccountRecord([void Function(AccountRecordBuilder) updates]) =
      _$AccountRecord;

  static AccountRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAccountRecordData({
  DocumentReference ownerRef,
  String state,
  DateTime createdAt,
  DateTime updatedAt,
}) =>
    serializers.toFirestore(
        AccountRecord.serializer,
        AccountRecord((a) => a
          ..ownerRef = ownerRef
          ..state = state
          ..createdAt = createdAt
          ..updatedAt = updatedAt));
