import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'avatars_record.g.dart';

abstract class AvatarsRecord
    implements Built<AvatarsRecord, AvatarsRecordBuilder> {
  static Serializer<AvatarsRecord> get serializer => _$avatarsRecordSerializer;

  @nullable
  String get path;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AvatarsRecordBuilder builder) =>
      builder..path = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('avatars');

  static Stream<AvatarsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AvatarsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AvatarsRecord._();
  factory AvatarsRecord([void Function(AvatarsRecordBuilder) updates]) =
      _$AvatarsRecord;

  static AvatarsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAvatarsRecordData({
  String path,
}) =>
    serializers.toFirestore(
        AvatarsRecord.serializer, AvatarsRecord((a) => a..path = path));
