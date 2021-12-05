import 'package:flutter_app/feature/main/main_cubit.dart';
import 'package:flutter_app/service/mock_api_service.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late MockApiService mockApiService;

  late MainCubit mainCubit;

  setUp(() {
    mockApiService = MockApiService();
    mainCubit = MainCubit(mockApiService);

  });

  tearDown(() {
    mainCubit.close();
  });

  group('Test MainCubit', () {

    test('Should start with initial state', () {
      expect(mainCubit.state, Init());
    });

    test(
      'emits [Loading, Error] when successful',
          () {
        expectLater(
          mainCubit,
          emitsInOrder(<MainState>[
            Loading(),
            Error(Exception('Something went wrong ¯\_(ツ)_/¯')
            )]
          ),
        );
        mainCubit.fetchListItems(true);
      },
    );

    test(
      'emits [Loading, Fetched] when successful',
          () {
        expectLater(
          mainCubit,
          emitsInOrder(<MainState>[
            Loading(),
            Fetched([for (int i = 0; i < 9; i++) 'My List Item nr $i'])
            ]
          ),
        );
        mainCubit.fetchListItems(false);
      },
    );

  });

}




