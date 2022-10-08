import "package:com_noopeshop_backend/config/dependency_config.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:com_noopeshop_backend/repositories/user_repository.dart";
import "package:com_noopeshop_backend/screens/home_screen.dart";
import "package:com_noopeshop_backend/services/service_factory.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependancies(
    kDebugMode ? "development" : "production",
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ServiceFactory(
      getIt.get<CommonRepository>(),
      getIt<UserRepository>(),
      child: const MaterialApp(
        title: "Noopeshop Backend",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
