import 'package:equatable/equatable.dart';

import '../../models/data_model.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UserEvent {}

class UpdateUsers extends UserEvent {
  final List<User> users;
  const UpdateUsers(this.users);
  @override
  List<Object> get props => [users];
}
