// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future<DocumentReference> createAmountStaging(
  String type,
  DocumentReference userAccountRef,
  DocumentReference guardianAccountRef,
) async {
  // get all the buckets for the user
  var buckets = await queryBucketsRecordOnce(
      queryBuilder: (bucketsRecord) => bucketsRecord
          .where('user_account_ref', isEqualTo: userAccountRef)
          .where('state', isEqualTo: 'active'));

  // createt the stading record we need
  final stgRcrdData = createStagingAmountRecordData(
      amount: 0.0,
      state: 'pending',
      type: type,
      userAccountRef: userAccountRef,
      createdByUserAccountRef: guardianAccountRef,
      createdAt: getCurrentTimestamp,
      updatedAt: getCurrentTimestamp);

  // write all the buckets so we can look it up on the page
  final stagingAmountRecordReference =
      await StagingAmountRecord.collection.add(stgRcrdData);
  List<Future<DocumentReference<Object>>> stagingAmountBucketWrites = [];

  buckets.forEach((bucketRecord) {
    final stg = createStagingAmountBucketsRecordData(
      isSelected: false,
      bucketRef: bucketRecord.reference,
      stagingAmountRef: stagingAmountRecordReference,
    );

    stagingAmountBucketWrites
        .add(StagingAmountBucketsRecord.collection.add(stg));
  });

  await Future.wait(stagingAmountBucketWrites);

  return stagingAmountRecordReference;
}
