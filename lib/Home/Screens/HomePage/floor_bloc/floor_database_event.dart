part of 'floor_database_bloc.dart';

@immutable
abstract class FloorDatabaseEvent extends Equatable {}

class onFloorDatabaseAddedEvent extends FloorDatabaseEvent {
  var database;
  onFloorDatabaseAddedEvent({required this.database});

  @override
  List<Object?> get props => [database];
}
