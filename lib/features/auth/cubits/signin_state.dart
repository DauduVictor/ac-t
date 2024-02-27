part of 'signin_cubit.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState.initial() = _Initial;
  const factory SigninState.loading() = _Loading;
  const factory SigninState.signedIn({
    required SignInResponse signInResponse
  }) = _SignedIn;
  const factory SigninState.error({
    required Exception error,
  }) = _Error;
}
