import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
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
}
