part of 'login_cubit.dart';

final class LoginState extends Equatable {
  const LoginState() : this._();

  const LoginState._({
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });


  LoginState withSubmissionInProgress() {
    return const LoginState._(
      status: FormzSubmissionStatus.inProgress,
    );
  }

  LoginState withSubmissionSuccess() {
    return const LoginState._(
      status: FormzSubmissionStatus.success,
    );
  }

  LoginState withSubmissionFailure([String? error]) {
    return LoginState._(
      status: FormzSubmissionStatus.failure,
      errorMessage: error,
    );
  }

  final FormzSubmissionStatus status;
  final String? errorMessage;

  bool get isValid => Formz.validate([]);

  @override
  List<Object?> get props => [status, errorMessage];
}
