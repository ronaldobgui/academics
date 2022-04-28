import 'package:academics/model/units/owner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  deleteOwner(String id) {
    DocumentReference docRef = _firestore.collection('owners').doc(id);
    docRef
        .delete()
        .whenComplete(() => debugPrint("Dados do $id deletado com sucesso!!"))
        .catchError((erro) => debugPrint("Erro ao deletar o $id -> $erro!!"));
  }

  updateOwner(Owner owner) {
    DocumentReference docRef = _firestore.collection('owners').doc(owner.id!);
    docRef
        .update(owner.toMap())
        .whenComplete(
            () => debugPrint("Dados do ${owner.id} deletado com sucesso!!"))
        .catchError(
            (erro) => debugPrint("Erro ao deletar o ${owner.id} -> $erro!!"));
  }
}
