import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vesser/src/features/start/data/model/internet_checker_model.dart';

import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';
import 'package:vesser/src/features/start/logic/entities/internet_checker.dart';

import 'check_internet_connection_service_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CheckInternetStatusService>(),
  MockSpec<CheckInternetTypeService>()
])
void main() {
  late MockCheckInternetStatusService mockedStatusService;
  late MockCheckInternetTypeService<InternetCheckerModel> mockedTypeService;
  late CheckInternetConnectionService connectionService;
  setUp(() {
    mockedStatusService = MockCheckInternetStatusService();
    mockedTypeService = MockCheckInternetTypeService<InternetCheckerModel>();
    connectionService = CheckInternetConnectionServiceImpl(
        statusService: mockedStatusService, typeService: mockedTypeService);
  });

  group("InternetConnection test", () {
    InternetCheckerModel expectedModel = InternetCheckerModel(
        connectivityStatus: InternetConnectionState.wifi,
        hasInternetConnection: true);
    test(
        "Should return InternetCheckerModel(Wifi, true) when internet connection is wifi and connection stable",
        () async {
      when(mockedTypeService.internetConnectionTypeChanges)
          .thenAnswer((realInvocation) {
        return Stream.value(expectedModel);
      });
      when(mockedStatusService.internetConnectionStatusChanges)
          .thenAnswer((realInvocation) => Stream.value(true));
      var result = await connectionService.currentConnectionStatus;
      expect(result, expectedModel);
    });

    test(
        "Should return InternetCheckerModel(Wifi, false) when internet connection is wifi and connection not stable",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.wifi,
          hasInternetConnection: false);
      when(mockedTypeService.internetConnectionTypeChanges)
          .thenAnswer((realInvocation) {
        return Stream.value(expectedModel);
      });
      when(mockedStatusService.internetConnectionStatusChanges)
          .thenAnswer((realInvocation) => Stream.value(false));
      var result = await connectionService.currentConnectionStatus;
      expect(result, expectedModel);
    });

    test(
        "Should emit InternetCheckerModel(Wifi, true) when internet connection is wifi and connection is stable",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.wifi,
          hasInternetConnection: true);
      when(mockedTypeService.internetConnectionTypeChanges)
          .thenAnswer((realInvocation) {
        return Stream.periodic(
            Duration(milliseconds: 300), (_) => expectedModel);
      });
      when(mockedStatusService.internetConnectionStatusChanges)
          .thenAnswer((realInvocation) {
        return Stream.periodic(Duration(milliseconds: 600), (_) => true);
      });
      var result = connectionService.internetConnectionChanges;
      await expectLater(result, emits(expectedModel));
    });

    test(
        "Should emit InternetCheckerModel(Mobile, false) when internet connection is mobile and connection is not stable",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.mobile,
          hasInternetConnection: false);
      when(mockedTypeService.internetConnectionTypeChanges)
          .thenAnswer((realInvocation) {
        return Stream.periodic(
            Duration(milliseconds: 300), (_) => expectedModel);
      });
      when(mockedStatusService.internetConnectionStatusChanges)
          .thenAnswer((realInvocation) {
        return Stream.periodic(Duration(milliseconds: 600), (_) => false);
      });
      var result = connectionService.internetConnectionChanges;
      await expectLater(result, emits(expectedModel));
    });

    test(
        "Should emit InternetCheckerModel(Undefined, false) when exception is raised",
        () async {
      expectedModel = InternetCheckerModel(
          connectivityStatus: InternetConnectionState.undefined,
          hasInternetConnection: false);
      when(mockedTypeService.internetConnectionTypeChanges)
          .thenAnswer((realInvocation) {
        return Stream.periodic(
            Duration(milliseconds: 300), (_) => expectedModel);
      });
      when(mockedStatusService.internetConnectionStatusChanges)
          .thenAnswer((realInvocation) {
        return Stream.error(UnimplementedError());
      });
      var result = connectionService.internetConnectionChanges;
      await expectLater(result, emits(expectedModel));
    });
  });
}
