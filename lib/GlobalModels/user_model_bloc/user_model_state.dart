part of 'user_model_bloc.dart';

@immutable
abstract class UserModelState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserModelInitial extends UserModelState {
  final UserModel user;
  UserModelInitial({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserModelAssign extends UserModelState {
  final UserModel user;
  UserModelAssign({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserModelUnassign extends UserModelState {}
