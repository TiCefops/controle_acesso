import 'package:equatable/equatable.dart';

abstract class LoginAppEvent extends Equatable {
  const LoginAppEvent();
  @override
  List<Object> get props {
    return [];
  }
}

class InitEvent extends LoginAppEvent {}

class LoggedEvent extends LoginAppEvent{}

class LoginSubmittedEvent extends LoginAppEvent{
  final String email;
  final String password;

  const LoginSubmittedEvent({required this.email, required this.password});
}

class ErrorEvent extends LoginAppEvent{

}