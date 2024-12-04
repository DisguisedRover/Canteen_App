import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  //get colection pf orders
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  //save order to database
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
      //additional fields here
    });
  }
}
