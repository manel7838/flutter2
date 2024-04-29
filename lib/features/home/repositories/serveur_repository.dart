import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfe/features/home/models/serveur_model.dart';

class ServeurRepository {
  final FirebaseFirestore _firebaseFirestore;

  ServeurRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Serveur>> getAllServeurs() {
    print('serveurrepo');
    print(_firebaseFirestore.collection('serveur').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Serveur.fromSnapshot(doc)).toList();
    }));
    return _firebaseFirestore
        .collection('serveurs')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Serveur.fromSnapshot(doc)).toList();
    });
  }
}
