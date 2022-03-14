import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_account_record.g.dart';

abstract class UserAccountRecord
    implements Built<UserAccountRecord, UserAccountRecordBuilder> {
  static Serializer<UserAccountRecord> get serializer =>
      _$userAccountRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'profile_image_path')
  String get profileImagePath;

  @nullable
  String get relationship;

  @nullable
  @BuiltValueField(wireName: 'account_ref')
  DocumentReference get accountRef;

  @nullable
  String get state;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  DateTime get updatedAt;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  DateTime get dob;

  @nullable
  String get gender;

  @nullable
  int get spendableCents;

  @nullable
  int get totalCents;

  @nullable
  @BuiltValueField(wireName: 'last_seen_total_cents')
  int get lastSeenTotalCents;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserAccountRecordBuilder builder) => builder
    ..name = ''
    ..displayName = ''
    ..profileImagePath = ''
    ..relationship = ''
    ..state = ''
    ..gender = ''
    ..spendableCents = 0
    ..totalCents = 0
    ..lastSeenTotalCents = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userAccount');

  static Stream<UserAccountRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserAccountRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserAccountRecord._();
  factory UserAccountRecord([void Function(UserAccountRecordBuilder) updates]) =
      _$UserAccountRecord;

  static UserAccountRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserAccountRecordData({
  String name,
  String displayName,
  String profileImagePath,
  String relationship,
  DocumentReference accountRef,
  String state,
  DateTime createdAt,
  DateTime updatedAt,
  DocumentReference userRef,
  DateTime dob,
  String gender,
  int spendableCents,
  int totalCents,
  int lastSeenTotalCents,
}) =>
    serializers.toFirestore(
        UserAccountRecord.serializer,
        UserAccountRecord((u) => u
          ..name = name
          ..displayName = displayName
          ..profileImagePath = profileImagePath
          ..relationship = relationship
          ..accountRef = accountRef
          ..state = state
          ..createdAt = createdAt
          ..updatedAt = updatedAt
          ..userRef = userRef
          ..dob = dob
          ..gender = gender
          ..spendableCents = spendableCents
          ..totalCents = totalCents
          ..lastSeenTotalCents = lastSeenTotalCents));
