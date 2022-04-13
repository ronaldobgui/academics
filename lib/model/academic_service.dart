import 'package:academics/model/academic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AcademicService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  add(Academic academic) {
    var academicMap = academic.toMap();
    _firestore.collection("academics").add(academicMap);
  }

  getAcademicList() {
    var academicCollection = _firestore.collection("academics");
    return academicCollection.snapshots();
  }
}
