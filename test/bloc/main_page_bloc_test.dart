import 'package:currency_rate_challange/bloc/main_page_bloc.dart';
import 'package:currency_rate_challange/data/remote/api_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'main_page_bloc_test.mocks.dart';

@GenerateMocks([ApiHelper])
void main() {
  MockApiHelper apiHelper = MockApiHelper();

  group("Check Main Page bloc", () {
    when(apiHelper.getRates()).thenAnswer((_) async => Future.value(""));

    test("check get data func that must have a true value in our stream", () async {
      MainPageBloc bloc = MainPageBloc();

      expectLater(bloc.updateList, emitsInOrder([emits(true)]));

      bloc.getData();
    });

    test("check update data func that must have a true value in our stream", () async {
      MainPageBloc bloc = MainPageBloc();

      expectLater(bloc.updateList, emitsInOrder([emits(true)]));

      bloc.updateData();
    });
  });
}
