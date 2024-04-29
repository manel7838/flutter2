import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String country;
  final String phone;
  final String? imageUrl;
  final String genre;
  final String specialite;

  const User({
    this.id,
    this.fullName = '',
    this.email = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.phone = '',
    this.imageUrl = '',
    this.genre = '',
    this.specialite = '',
  });

  User copyWith(
      {String? id,
      String? genre,
      String? specialite,
      String? fullName,
      String? email,
      String? address,
      String? city,
      String? country,
      String? phone,
      String? imageUrl}) {
    return User(
        id: id ?? this.id,
        specialite: specialite ?? this.specialite,
        genre: genre ?? this.genre,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        address: address ?? this.address,
        city: city ?? this.city,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        imageUrl: imageUrl ?? this.imageUrl);
  }

  static const empty = User(id: '');
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      genre: snap['genre'],
      specialite: snap['specialite'],
      fullName: snap['fullName'],
      email: snap['email'],
      address: snap['address'],
      city: snap['city'],
      country: snap['country'],
      phone: snap['phone'],
      imageUrl: snap['imageUrl'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'country': country,
      'phone': phone,
      // 'imageUrl': imageUrl,
      'genre': genre,
      'specialite': specialite
    };
  }

  @override
  List<Object?> get props => [
        id,
        specialite,
        genre,
        fullName,
        email,
        address,
        city,
        country,
        phone,
        imageUrl
      ];
}
