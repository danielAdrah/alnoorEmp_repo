class UserState {}

final class UserInitial extends UserState {}

final class LogInSuccess extends UserState {}

final class LogInLoading extends UserState {}

final class LogInFailure extends UserState {
  final String errMessage;

  LogInFailure({required this.errMessage});
}
//================================================