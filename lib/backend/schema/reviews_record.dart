import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reviews_record.g.dart';

abstract class ReviewsRecord
    implements Built<ReviewsRecord, ReviewsRecordBuilder> {
  static Serializer<ReviewsRecord> get serializer => _$reviewsRecordSerializer;

  @nullable
  String get title;

  @nullable
  String get description;

  @nullable
  DocumentReference get ref;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReviewsRecordBuilder builder) => builder
    ..title = ''
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReviewsRecord._();
  factory ReviewsRecord([void Function(ReviewsRecordBuilder) updates]) =
      _$ReviewsRecord;

  static ReviewsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReviewsRecordData({
  String title,
  String description,
  DocumentReference ref,
}) =>
    serializers.toFirestore(
        ReviewsRecord.serializer,
        ReviewsRecord((r) => r
          ..title = title
          ..description = description
          ..ref = ref));
