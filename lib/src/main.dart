import 'common/helpers/platform.dart';
import 'features/start/view/pages/start/starter.dart';
import 'features/start/view/pages/start/starter_io.dart';

@pragma('vm:entry-point')
void main() {
  AppStarter starter = AppStarterImpl(platformer: Platformer());
  starter();
}
