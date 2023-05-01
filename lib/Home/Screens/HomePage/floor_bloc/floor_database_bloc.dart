import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'floor_database_event.dart';
part 'floor_database_state.dart';

class FloorDatabaseBloc extends Bloc<FloorDatabaseEvent, FloorDatabaseState> {
  FloorDatabaseBloc() : super(FloorDatabaseInitial()) {
    on<FloorDatabaseEvent>((event, emit) {
      emit(FloorDatabaseInitial());
    });

    on<onFloorDatabaseAddedEvent>((event, emit) {
      log("Adding State");
      emit(AssignFloorDatabase(database: event.database));
    });
  }
}
