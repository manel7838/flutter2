import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Serveur extends Equatable {
  final String? id;
  final String name;
  final int price;
  final String? remise;
  final String capacite;
  final String imageURL;
  final String description;

  const Serveur(
      {this.id,
      required this.description,
      required this.imageURL,
      required this.name,
      required this.price,
      this.remise,
      required this.capacite});
  @override
  List<Object?> get props =>
      [id, price, description, imageURL, name, remise, capacite];

  static Serveur fromSnapshot(DocumentSnapshot snap) {
    Serveur serveur = Serveur(
      id: snap.id,
      description: snap['description'],
      imageURL: snap['image'],
      name: snap['name'],
      price: snap['price'],
      // remise: snap['remise'],
      capacite: snap['capacite'],
    );
    print("serveur is");
    print(serveur);
    return serveur;
  }
}
