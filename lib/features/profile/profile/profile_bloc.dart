import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:pfe/features/profile/blocs/auth/auth_bloc.dart';
import 'package:pfe/features/profile/models/data_model.dart';
import 'package:pfe/features/profile/user/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final UserRepository _userRepository;
  StreamSubscription? _authSubscription;

  ProfileBloc({
    required AuthBloc authBloc,
    required UserRepository userRepository,
  })  : _authBloc = authBloc,
        _userRepository = userRepository,
        super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.user is AuthUserChanged) {
        if (state.user != null) {
          print('authSubscription');
          add(LoadProfile(state.authUser));
        }
      }
    });
  }

  void _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) {
    print('event.authUser=');
    print(event.authUser);
    if (event.authUser != null) {
      print('success Profileauthenticated ');

      _userRepository.getUser(event.authUser!.uid).listen((user) {
        add(
          UpdateProfile(user: user),
        );
      });
    } else {
      print('error ProfileUnauthenticated ');
      emit(ProfileUnauthenticated());
    }
  }

  void _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) {
    _userRepository.updateUser(event.user);
    emit(ProfileLoaded(user: event.user));
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
