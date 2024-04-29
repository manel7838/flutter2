import 'package:equatable/equatable.dart';
import 'package:pfe/features/home/models/serveur_model.dart';

abstract class ServeurEvent extends Equatable {
  const ServeurEvent();

  @override
  List<Object> get props => [];
}

class UpdateProducts extends ServeurEvent {
  final List<Serveur> products;

  const UpdateProducts(this.products);

  @override
  List<Object> get props => [products];
}

class LoadServeurs extends ServeurEvent {
  final List<Serveur> serveurs;

  const LoadServeurs({
    this.serveurs = const <Serveur>[],
  });

  @override
  List<Object> get props => [serveurs];
}


//


