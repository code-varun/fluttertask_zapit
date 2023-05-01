import 'package:bloc/bloc.dart';
import 'package:crypto_app/GlobalModels/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_model_event.dart';
part 'user_model_state.dart';

class UserModelBloc extends Bloc<UserModelEvent, UserModelState> {
  static UserModelBloc? _instance;
  static UserModelBloc get instance {
    _instance ??= UserModelBloc();
    return _instance!;
  }

  UserModelBloc()
      : super(
          UserModelInitial(
            user: UserModel(
              userUID: '123',
              email: 'testuser@gmail.com',
              name: 'user',
              balance: 130.12,
            ),
          ),
        ) {
    on<UserModelEvent>((event, emit) {});

    on<UserModelAdded>((event, emit) {
      emit(UserModelAssign(user: event.user));
    });
  }
}
