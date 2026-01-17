
import 'package:ads_client/export.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   usePathUrlStrategy();
  await LocalStorage.init();
  DioHelper.init();
  AppStyle.init();
  await ThemeCustomizer.init();
  HttpOverrides.global = AppHttpOverrides();

  runApp(
    Phoenix(
      child: ChangeNotifierProvider<AppNotifier>(
        create: (context) => AppNotifier(),
        child: const AdsClientApp()
      ),
    ),
  );
}
