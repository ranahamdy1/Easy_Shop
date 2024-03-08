part of 'password_cubit.dart';

@immutable
abstract class PasswordState {}

class PasswordInitial extends PasswordState {}

class PasswordLoadingState extends PasswordState {}

class PasswordSuccessState  extends PasswordState {}

class PasswordFailedState  extends PasswordState {
  final String msg;
  PasswordFailedState ({required this.msg});
}