import 'package:equatable/equatable.dart';

class LoginAppState extends Equatable{
  LoginAppState init() {
    return LoginAppState();
  }

  LoginAppState clone() {
    return LoginAppState();
  }
  @override
  List<Object?> get props =>[];
}

class ErrorState extends LoginAppState{
  final  String message;

  ErrorState({required this.message});
  @override
  List<Object> get props =>[message];
}

class LoginSubmittedState extends LoginAppState{
  final  bool load;

  LoginSubmittedState({required this.load});
  @override
  List<Object> get props =>[load];
}
