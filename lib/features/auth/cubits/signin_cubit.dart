import 'package:acm_test/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.dart';
part 'signin_cubit.freezed.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({
    UserRepository? userRepository,
  })  : _userRepository = userRepository ?? UserRepository(),
        super(const SigninState.initial());

  final UserRepository _userRepository;

  ///Function to login user
  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(const _Loading());
      final signInResponse = await _userRepository.loginUser(
        email: email,
        password: password,
      );
      emit(_SignedIn(signInResponse: signInResponse));
    } on UserException catch (e) {
      emit(_Error(error: e));
    }
  }
}
