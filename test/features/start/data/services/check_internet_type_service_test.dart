import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vesser/src/features/start/data/model/internet_checker_model.dart';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';
import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';

import 'check_internet_type_service_test.mocks.dart';



@GenerateNiceMocks([MockSpec<Connectivity>()])
void main() {
  late CheckInternetTypeService internetTypeService;

  late MockConnectivity internetProvider;
  setUp(() {
    internetProvider = MockConnectivity();
    internetTypeService =
        CheckInternetTypeServiceImpl(connectionSource: internetProvider);
  });

  group("Connection type test.", () {
    late InternetCheckerModel expectedModel;

    test(
        "Should return InternetConnectionState.mobile when connected by mobile",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.mobile,
          hasInternetConnection: false);
      when(internetProvider.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(ConnectivityResult.mobile));

      var stream = internetTypeService.internetConnectionTypeChanges;
      await expectLater((await stream.last).connectivityStatus,
          expectedModel.connectivityStatus);
      verify(internetProvider.onConnectivityChanged);
    });

    test("Should return InternetConnectionState.wifi when connected by wifi",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.wifi,
          hasInternetConnection: false);
      when(internetProvider.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(ConnectivityResult.wifi));

      var stream = internetTypeService.internetConnectionTypeChanges;
      await expectLater((await stream.last).connectivityStatus,
          expectedModel.connectivityStatus);
      verify(internetProvider.onConnectivityChanged);
    });

    test("Should return InternetConnectionState.lan when connected by ethernet",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.lan,
          hasInternetConnection: false);
      when(internetProvider.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(ConnectivityResult.ethernet));

      var stream = internetTypeService.internetConnectionTypeChanges;
      await expectLater((await stream.last).connectivityStatus,
          expectedModel.connectivityStatus);
      verify(internetProvider.onConnectivityChanged);
    });

    test("Should return InternetConnectionState.vpn when connected by vpn",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.vpn,
          hasInternetConnection: false);
      when(internetProvider.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(ConnectivityResult.vpn));

      var stream = internetTypeService.internetConnectionTypeChanges;
      await expectLater((await stream.last).connectivityStatus,
          expectedModel.connectivityStatus);
      verify(internetProvider.onConnectivityChanged);
    });

    test("Should return InternetConnectionState.none when not connected",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.none,
          hasInternetConnection: false);
      when(internetProvider.onConnectivityChanged)
          .thenAnswer((_) => Stream.value(ConnectivityResult.none));

      var stream = internetTypeService.internetConnectionTypeChanges;
      await expectLater((await stream.last).connectivityStatus,
          expectedModel.connectivityStatus);
      verify(internetProvider.onConnectivityChanged);
    });
  });
}
