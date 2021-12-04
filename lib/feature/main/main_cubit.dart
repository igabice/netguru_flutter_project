import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:flutter_app/service/mock_api_service.dart';

@LazySingleton()
class MainCubit extends Cubit<MainState> {
  MockApiService mockApiService;

   MainCubit(this.mockApiService) : super(Init());


  @override
  void onTransition(Transition<Null, MainState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  Future<void> fetchListItems(bool showError) async {
    emit(Loading());
    (await mockApiService.getItems(showError)).fold(
      (error) => emit(Error(error)),
      (list) => emit(Fetched(list)),
    );
  }
}

@immutable
abstract class MainState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends MainState {}

class Loading extends MainState {}

class Fetched extends MainState {
  final List<String> list;

  Fetched(this.list);
}

class Error extends MainState {
  final Exception error;

  Error(this.error);
}
