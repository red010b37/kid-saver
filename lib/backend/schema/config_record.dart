import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'config_record.g.dart';

abstract class ConfigRecord
    implements Built<ConfigRecord, ConfigRecordBuilder> {
  static Serializer<ConfigRecord> get serializer => _$configRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'app_version')
  String get appVersion;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ConfigRecordBuilder builder) =>
      builder..appVersion = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ConfigRecord._();
  factory ConfigRecord([void Function(ConfigRecordBuilder) updates]) =
      _$ConfigRecord;

  static ConfigRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createConfigRecordData({
  String appVersion,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        ConfigRecord.serializer,
        ConfigRecord((c) => c
          ..appVersion = appVersion
          ..createdAt = createdAt));
