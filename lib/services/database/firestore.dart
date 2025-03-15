import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of orders
  final CollectionReference orders =
  FirebaseFirestore.instance.collection('orders');
  // get collection of Contact
  final CollectionReference contacts =
  FirebaseFirestore.instance.collection('contacts');


  //save order to db
Future<void> saveOrderToDatabase(String receipt, String paymentMethod) async {
  await orders.add({
    'date': DateTime.now(),
    'order': receipt,
    'paymentMethod': paymentMethod,
  });
}
// Save contact form data to Firestore
  Future<void> saveContactForm(String name, String email, String contact, String description) async {
    await contacts.add({
      'name': name,
      'email': email,
      'contact': contact,
      'description': description,
      'timestamp': Timestamp.now(),
    });
  }
}
