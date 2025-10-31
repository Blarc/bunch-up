part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable {
  const SignUpState() : this._();

  const SignUpState._({
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  final FormzSubmissionStatus status;
  final String? errorMessage;


  SignUpState withSubmissionInProgress() {
    return const SignUpState._(
      status: FormzSubmissionStatus.inProgress,
    );
  }

  SignUpState withSubmissionSuccess() {
    return const SignUpState._(
      status: FormzSubmissionStatus.success,
    );
  }

  SignUpState withSubmissionFailure([String? error]) {
    return SignUpState._(
      status: FormzSubmissionStatus.failure,
      errorMessage: error,
    );
  }

  bool get isValid => Formz.validate([]);

  @override
  List<Object?> get props => [
    status,
    errorMessage,
  ];
}
