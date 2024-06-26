// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:pfe/features/profile/auth/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> logInWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      print("loggedin");
      final user = auth.FirebaseAuth.instance.currentUser;

      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }

  // Future<void> logInWithGoogle() async {
  //   emit(state.copyWith(status: LoginStatus.submitting));
  //   try {
  //     // await _authRepository.logInWithGoogle();
  //     emit(state.copyWith(status: LoginStatus.success));
  //   } catch (_) {}
  // }
}
