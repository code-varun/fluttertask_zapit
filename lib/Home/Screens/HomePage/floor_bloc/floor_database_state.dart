part of 'floor_database_bloc.dart';

@immutable
abstract class FloorDatabaseState extends Equatable {}

class FloorDatabaseInitial extends FloorDatabaseState {
  @override
  List<Object?> get props => [];
}

class AssignFloorDatabase extends FloorDatabaseState {
  var database;
  AssignFloorDatabase({required this.database});

  @override
  List<Object?> get props => [database];
}

class UnassignFloorDatabaseInitial extends FloorDatabaseState {
  @override
  List<Object?> get props => [];
}
