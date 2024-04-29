part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUser extends AuthEvent {
  final User user;

  const UpdateUser({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthUserChanged extends AuthEvent {
  final auth.User? authUser;
  final User? user;

  const AuthUserChanged({
    required this.authUser,
    this.user,
  });

  @override
  List<Object?> get props => [
        authUser,
        user,
      ];
}

class UpdateUserImages extends AuthEvent {
  final User? user;
  final XFile image;

  const UpdateUserImages({
    this.user,
    required this.image,
  });

  @override
  List<Object?> get props => [user, image];
}
