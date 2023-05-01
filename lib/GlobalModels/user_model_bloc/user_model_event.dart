part of 'user_model_bloc.dart';

@immutable
abstract class UserModelEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserModelAdded extends UserModelEvent {
  final UserModel user;
  UserModelAdded({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserModelRemove extends UserModelEvent {
  @override
  List<Object?> get props => [];
}
