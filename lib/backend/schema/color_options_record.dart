import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'color_options_record.g.dart';

abstract class ColorOptionsRecord
    implements Built<ColorOptionsRecord, ColorOptionsRecordBuilder> {
  static Serializer<ColorOptionsRecord> get serializer =>
      _$colorOptionsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ColorOptionsRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('colorOptions');

  static Stream<ColorOptionsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ColorOptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ColorOptionsRecord._();
  factory ColorOptionsRecord(
          [void Function(ColorOptionsRecordBuilder) updates]) =
      _$ColorOptionsRecord;

  static ColorOptionsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createColorOptionsRecordData() => serializers.toFirestore(
    ColorOptionsRecord.serializer, ColorOptionsRecord((c) => c));
