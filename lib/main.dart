import "package:com_noopeshop_backend/config/dependency_config.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:com_noopeshop_backend/repositories/upload_repository.dart";
import "package:com_noopeshop_backend/screens/home_screen.dart";
import "package:com_noopeshop_backend/services/service_factory.dart";
import "package:com_noopeshop_backend/utils/pretreatment.dart";
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
      getIt.get<UploadRepository>(),
      getIt.get<PreTreatment>(),
      child: MaterialApp(
        title: "Noopeshop Backend",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.black87,
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
