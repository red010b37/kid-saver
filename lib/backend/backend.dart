import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/users_record.dart';
import 'schema/onboarding_record.dart';
import 'schema/account_record.dart';
import 'schema/user_account_record.dart';
import 'schema/avatars_record.dart';
import 'schema/buckets_record.dart';
import 'schema/staging_amount_record.dart';
import 'schema/staging_amount_buckets_record.dart';
import 'schema/transaction_record.dart';
import 'schema/config_record.dart';
import 'schema/color_options_record.dart';
import 'schema/serializers.dart';

export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/users_record.dart';
export 'schema/onboarding_record.dart';
export 'schema/account_record.dart';
export 'schema/user_account_record.dart';
export 'schema/avatars_record.dart';
export 'schema/buckets_record.dart';
export 'schema/staging_amount_record.dart';
export 'schema/staging_amount_buckets_record.dart';
export 'schema/transaction_record.dart';
export 'schema/config_record.dart';
export 'schema/color_options_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Stream<List<UsersRecord>> queryUsersRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<UsersRecord>> queryUsersRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<UsersRecord>> queryUsersRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(UsersRecord.collection, UsersRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query OnboardingRecords (as a Stream and as a Future).
Stream<List<OnboardingRecord>> queryOnboardingRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(OnboardingRecord.collection, OnboardingRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<OnboardingRecord>> queryOnboardingRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        OnboardingRecord.collection, OnboardingRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<OnboardingRecord>> queryOnboardingRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        OnboardingRecord.collection, OnboardingRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query AccountRecords (as a Stream and as a Future).
Stream<List<AccountRecord>> queryAccountRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(AccountRecord.collection, AccountRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<AccountRecord>> queryAccountRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(AccountRecord.collection, AccountRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<AccountRecord>> queryAccountRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(AccountRecord.collection, AccountRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query UserAccountRecords (as a Stream and as a Future).
Stream<List<UserAccountRecord>> queryUserAccountRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(UserAccountRecord.collection, UserAccountRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<UserAccountRecord>> queryUserAccountRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        UserAccountRecord.collection, UserAccountRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<UserAccountRecord>> queryUserAccountRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        UserAccountRecord.collection, UserAccountRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query AvatarsRecords (as a Stream and as a Future).
Stream<List<AvatarsRecord>> queryAvatarsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(AvatarsRecord.collection, AvatarsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<AvatarsRecord>> queryAvatarsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(AvatarsRecord.collection, AvatarsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<AvatarsRecord>> queryAvatarsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(AvatarsRecord.collection, AvatarsRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query BucketsRecords (as a Stream and as a Future).
Stream<List<BucketsRecord>> queryBucketsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(BucketsRecord.collection, BucketsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<BucketsRecord>> queryBucketsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(BucketsRecord.collection, BucketsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<BucketsRecord>> queryBucketsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(BucketsRecord.collection, BucketsRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query StagingAmountRecords (as a Stream and as a Future).
Stream<List<StagingAmountRecord>> queryStagingAmountRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        StagingAmountRecord.collection, StagingAmountRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<StagingAmountRecord>> queryStagingAmountRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        StagingAmountRecord.collection, StagingAmountRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<StagingAmountRecord>> queryStagingAmountRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        StagingAmountRecord.collection, StagingAmountRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query StagingAmountBucketsRecords (as a Stream and as a Future).
Stream<List<StagingAmountBucketsRecord>> queryStagingAmountBucketsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(StagingAmountBucketsRecord.collection,
        StagingAmountBucketsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<StagingAmountBucketsRecord>> queryStagingAmountBucketsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(StagingAmountBucketsRecord.collection,
        StagingAmountBucketsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<StagingAmountBucketsRecord>>
    queryStagingAmountBucketsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
        queryCollectionPage(StagingAmountBucketsRecord.collection,
            StagingAmountBucketsRecord.serializer,
            queryBuilder: queryBuilder,
            nextPageMarker: nextPageMarker,
            pageSize: pageSize);

/// Functions to query TransactionRecords (as a Stream and as a Future).
Stream<List<TransactionRecord>> queryTransactionRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(TransactionRecord.collection, TransactionRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<TransactionRecord>> queryTransactionRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        TransactionRecord.collection, TransactionRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<TransactionRecord>> queryTransactionRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        TransactionRecord.collection, TransactionRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query ConfigRecords (as a Stream and as a Future).
Stream<List<ConfigRecord>> queryConfigRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(ConfigRecord.collection, ConfigRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ConfigRecord>> queryConfigRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(ConfigRecord.collection, ConfigRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<ConfigRecord>> queryConfigRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(ConfigRecord.collection, ConfigRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

/// Functions to query ColorOptionsRecords (as a Stream and as a Future).
Stream<List<ColorOptionsRecord>> queryColorOptionsRecord(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollection(
        ColorOptionsRecord.collection, ColorOptionsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<List<ColorOptionsRecord>> queryColorOptionsRecordOnce(
        {Query Function(Query) queryBuilder,
        int limit = -1,
        bool singleRecord = false}) =>
    queryCollectionOnce(
        ColorOptionsRecord.collection, ColorOptionsRecord.serializer,
        queryBuilder: queryBuilder, limit: limit, singleRecord: singleRecord);

Future<FFFirestorePage<ColorOptionsRecord>> queryColorOptionsRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) =>
    queryCollectionPage(
        ColorOptionsRecord.collection, ColorOptionsRecord.serializer,
        queryBuilder: queryBuilder,
        nextPageMarker: nextPageMarker,
        pageSize: pageSize);

Stream<List<T>> queryCollection<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
    CollectionReference collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

class FFFirestorePage<T> {
  final List<T> data;
  final QueryDocumentSnapshot nextPageMarker;

  FFFirestorePage(this.data, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  CollectionReference collection,
  Serializer<T> serializer, {
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  final docSnapshots = await query.get();
  final data = docSnapshots.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList();
  final nextPageToken =
      docSnapshots.docs.isEmpty ? null : docSnapshots.docs.last;
  return FFFirestorePage(data, nextPageToken);
}

// Creates a Firestore record representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
