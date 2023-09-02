
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:vesser/src/features/start/data/services/check_internet_connection_service.dart';

import 'check_internet_connection_status_test.mocks.dart';


@GenerateNiceMocks([MockSpec<InternetConnection>()])
void main() {
  late CheckInternetStatusService checkInternetStatusService;

  late MockInternetConnection connectionProvider;
  setUp(() {
    connectionProvider = MockInternetConnection();
    checkInternetStatusService =
        CheckInternetStatusServiceImpl(connectionSource: connectionProvider);
  });

  group("Internet connection test.", () {
    test("should emit true when internet is accessed", () {
      when(connectionProvider.onStatusChange).thenAnswer(
          (realInvocation) => Stream.value(InternetStatus.connected));
      var internetStream =
          checkInternetStatusService.internetConnectionStatusChanges;
      expectLater(internetStream, emits(true));
    });
    test("should emit false when internet is unavailable", () {
      when(connectionProvider.onStatusChange).thenAnswer(
          (realInvocation) => Stream.value(InternetStatus.disconnected));
      var internetStream =
          checkInternetStatusService.internetConnectionStatusChanges;
      expectLater(internetStream, emits(false));
    });
  });

 
}
