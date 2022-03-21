// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';

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
  var stagingAmountInCents = (stagingAmountRecord.amount * 100).toInt() ?? 0;

  var userAccountTotalCents = userAccountRecord.totalCents ?? 0;
  var userAccountSpendableCents = userAccountRecord.spendableCents ?? 0;

  var test = 0;

  await Future.forEach<StagingAmountBucketsRecord>(stagingBuckets,
      (stagingBucket) async {
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
      await TransactionRecord.collection.add(tsData);

      // add up the and update bucket
      var bucketRecord =
          await BucketsRecord.getDocumentOnce(stagingBucket.bucketRef);
      var bucketRecordCents = bucketRecord.totalCents ?? 0;

      switch (type) {
        case 'add':
          bucketRecordCents += stagingAmountInCents;
          userAccountTotalCents += stagingAmountInCents;

          if (bucketRecord.type == 'spendable') {
            userAccountSpendableCents += stagingAmountInCents;
          }

          break;
        case 'remove':
          bucketRecordCents -= stagingAmountInCents;
          userAccountTotalCents -= stagingAmountInCents;

          if (bucketRecord.type == 'spendable') {
            userAccountSpendableCents -= stagingAmountInCents;
          }
          break;
        default:
        // do nothing;
      }

      var updateBucketData = createBucketsRecordData(
          totalCents: bucketRecordCents, updatedAt: getCurrentTimestamp);
      await bucketRecord.reference.update(updateBucketData);

      //add the user account to the total cents

    }
  });

  var userAccUpdateData = createUserAccountRecordData(
      totalCents: userAccountTotalCents,
      spendableCents: userAccountSpendableCents,
      updatedAt: getCurrentTimestamp);
  await stagingAmountRecord.userAccountRef.update(userAccUpdateData);
}
