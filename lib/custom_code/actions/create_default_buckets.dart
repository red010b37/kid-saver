// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

// Begin custom action code
// Begin custom action code
Future createDefaultBuckets(
  DocumentReference userAccountRef,
  DocumentReference accountRef,
) async {
  // Add your function code here!

  var spendableBucket = createBucketsRecordData(
    color: Colors.amberAccent.value.toString(),
    createdAt: getCurrentTimestamp,
    updatedAt: getCurrentTimestamp,
    state: 'active',
    type: 'Spendable',
    totalCents: 0,
    userAccountRef: userAccountRef,
    accountRef: accountRef,
    canUserDelete: false,
    description: '',
    lastSeenTotalCents: 0,
    name: 'Spendable',
  );

  var savingsBucket = createBucketsRecordData(
    color: Color.fromRGBO(14, 22, 77, 1.0).value.toString(),
    name: 'Savings',
    lastSeenTotalCents: 0,
    description: '',
    canUserDelete: false,
    accountRef: accountRef,
    userAccountRef: userAccountRef,
    totalCents: 0,
    type: 'savings',
    state: 'active',
    updatedAt: getCurrentTimestamp,
    createdAt: getCurrentTimestamp,
  );

  await BucketsRecord.collection.add(spendableBucket);
  await BucketsRecord.collection.add(savingsBucket);
}
