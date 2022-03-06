import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'onboarding_record.g.dart';

abstract class OnboardingRecord
    implements Built<OnboardingRecord, OnboardingRecordBuilder> {
  static Serializer<OnboardingRecord> get serializer =>
      _$onboardingRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'profile_image_path')
  String get profileImagePath;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: 'updated_at')
  DateTime get updatedAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OnboardingRecordBuilder builder) => builder
    ..name = ''
    ..email = ''
    ..displayName = ''
    ..profileImagePath = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('onboarding');

  static Stream<OnboardingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OnboardingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OnboardingRecord._();
  factory OnboardingRecord([void Function(OnboardingRecordBuilder) updates]) =
      _$OnboardingRecord;

  static OnboardingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOnboardingRecordData({
  String name,
  String email,
  String displayName,
  String profileImagePath,
  DateTime createdAt,
  DateTime updatedAt,
}) =>
    serializers.toFirestore(
        OnboardingRecord.serializer,
        OnboardingRecord((o) => o
          ..name = name
          ..email = email
          ..displayName = displayName
          ..profileImagePath = profileImagePath
          ..createdAt = createdAt
          ..updatedAt = updatedAt));
