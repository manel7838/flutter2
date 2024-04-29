import 'package:equatable/equatable.dart';
import 'package:pfe/features/home/models/serveur_model.dart';

abstract class ServeurState extends Equatable {
  const ServeurState();

  @override
  List<Object> get props => [];
}

class ServeurLoading extends ServeurState {}

class ServeurLoaded extends ServeurState {
  final List<Serveur> serveurs;

  const ServeurLoaded({this.serveurs = const <Serveur>[]});

  @override
  List<Object> get props => [serveurs];
}
