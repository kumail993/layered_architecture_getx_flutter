import 'package:ads_client/export.dart';

class AdsClientApp extends StatelessWidget {
  const AdsClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (_, provider, __) {
        return GetMaterialApp(
          title: 'Ads Client',
          debugShowCheckedModeBanner: false,
          scrollBehavior: CustomScrollBehavior(),
          theme: MainAppTheme.lightTheme,
          darkTheme: MainAppTheme.darkTheme,
          themeMode: ThemeCustomizer.instance.theme,
          initialRoute: AppRouter.initialRoute,
          getPages: AppRouter.pages(),
          builder: (context, child) {
            child = ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 1200, name: TABLET),
                const Breakpoint(
                  start: 1201,
                  end: double.infinity,
                  name: DESKTOP,
                ),
              ],
            );

            return EasyLoading.init()(context, child);
          },
        );
      },
    );
  }
}
