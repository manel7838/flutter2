import 'package:equatable/equatable.dart';
import 'package:pfe/features/home/models/serveur_model.dart';

class Cart extends Equatable {
  final List<Serveur> serveurs;

  const Cart({this.serveurs = const <Serveur>[]});

  @override
  List<Object?> get props => [serveurs];

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal => 0;
  //  serveurs.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    return subtotal;
  }
}
