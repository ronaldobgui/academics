import 'package:academics/model/units/owner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OwnerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  add(Owner owner) {
    var ownerMap = owner.toMap();
    _firestore.collection("owners").add(ownerMap);
  }

  getOwners() {
    var ownerCollection = _firestore.collection("owners");
    return ownerCollection.snapshots();
  }
}
