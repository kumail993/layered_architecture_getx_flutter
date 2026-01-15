import 'package:ads_client/export.dart';

class Routes {
  static const String login = '/auth/login';
  static const String dashboard = '/';
}

class AppRouter {
  static String initialRoute = Routes.login;

  static List<GetPage> pages() {
    return [
      GetPage(
        name: Routes.login,
        page: () => const LoginView(),
        binding: LoginBindings()
      ),
    ];
  }
}

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // log(route.toString());
    if (!AuthRepository.isLoggedIn) {
      // log('here');
      return const RouteSettings(name: Routes.login);
    }
    // log('here 2');
    return null;
  }
}
