// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
// Begin custom action code

// Begin custom action code
Future calculateAmounts(DocumentReference stagingAmountRef) async {
  // Add your function code here!

  var stagingAmountRecord =
      await StagingAmountRecord.getDocumentOnce(stagingAmountRef);
  var userAccountRecord = await UserAccountRecord.getDocumentOnce(
      stagingAmountRecord.userAccountRef);

  var stagingBuckets = await queryStagingAmountBucketsRecordOnce(
      queryBuilder: (bucketsRecord) => bucketsRecord.where('staging_amount_ref',
          isEqualTo: stagingAmountRecord.reference));
  var type = stagingAmountRecord.type;
  var stagingAmountInCents = (stagingAmountRecord.amount * 100).toInt();

  var userAccountTotalCents = userAccountRecord.totalCents;

  // create all the transactions
  List<Future<DocumentReference<Object>>> transactionWrites = [];
  stagingBuckets.forEach((stagingBucket) async {
    if (stagingBucket.isSelected) {
      // create the transactions
      var tsData = createTransactionRecordData(
        type: type,
        description: stagingAmountRecord.description,
        amountCents: stagingAmountInCents,
        bucketRef: stagingBucket.bucketRef,
        assignedUserAccountRef: stagingAmountRecord.userAccountRef,
        creatorUserAccountRef: stagingAmountRecord.createdByUserAccountRef,
        updatedAt: getCurrentTimestamp,
        createdAt: getCurrentTimestamp,
      );
      transactionWrites.add(TransactionRecord.collection.add(tsData));

      // add up the and update bucket
      var bucketRecord =
          await BucketsRecord.getDocumentOnce(stagingBucket.bucketRef);
      var bucketRecordCents = bucketRecord.totalCents;

      switch (type) {
        case 'add':
          bucketRecordCents += stagingAmountInCents;
          userAccountTotalCents += stagingAmountInCents;
          break;
        case 'remove':
          bucketRecordCents -= stagingAmountInCents;
          userAccountTotalCents -= stagingAmountInCents;
          break;
        default:
        // do nothing;
      }
      bucketRecordCents += stagingAmountInCents;

      var updateBucketData = createBucketsRecordData(
          totalCents: bucketRecordCents, updatedAt: getCurrentTimestamp);
      transactionWrites.add(bucketRecord.reference.update(updateBucketData));

      //add the user account to the total cents

    }
  });

  var userAccUpdateData = createUserAccountRecordData(
      totalCents: userAccountTotalCents, updatedAt: getCurrentTimestamp);

  transactionWrites.add(userAccountRecord.reference.update(userAccUpdateData));
  await Future.wait(transactionWrites);
}
