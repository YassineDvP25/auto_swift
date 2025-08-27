class UserState {}

final class UserInitial extends UserState {}

final class SignInLoading extends UserState {}
final class SignUpLoading extends UserState {}

final class SignInSuccess extends UserState {}
final class SignUpSuccess extends UserState {}


final class SignInFailure extends UserState {
  final String errMessage;
  SignInFailure(this.errMessage);
}
final class SignUpFailure extends UserState {
  final String errMessage;
  SignUpFailure(this.errMessage);
}
final class UploadProfilePicture extends UserState{}