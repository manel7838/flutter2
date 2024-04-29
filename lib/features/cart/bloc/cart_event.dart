part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {}

class AddServeur extends CartEvent {
  final Serveur serveur;

  const AddServeur(this.serveur);

  @override
  List<Object> get props => [serveur];
}

class RemoveServeur extends CartEvent {
  final Serveur serveur;

  const RemoveServeur(this.serveur);

  @override
  List<Object> get props => [serveur];
}
