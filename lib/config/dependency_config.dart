import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_functions/cloud_functions.dart";
import "package:com_noopeshop_backend/config/firebase_config.dart";
import "package:com_noopeshop_backend/repositories/category_repository.dart";
import "package:com_noopeshop_backend/repositories/graphql_repository.dart";
import "package:com_noopeshop_backend/repositories/product_repository.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r"$initGetIt",
)
Future<void> configureDependancies(
  String environment,
) async =>
    $initGetIt(
      getIt,
      environment: environment,
    );

$initGetIt(
  GetIt getIt, {
  required String environment,
  EnvironmentFilter? environmentFilter,
}) async {
  await configureFirebase(
    environment,
  );

  final gh = GetItHelper(getIt, environment);

  // FirebaseFirestore
  gh.lazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );

  // FirebaseStorage
  gh.lazySingleton<FirebaseStorage>(
    () => FirebaseStorage.instance,
  );

  // FirebaseAuth
  gh.lazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  // FirebaseFunctions
  gh.lazySingleton<FirebaseFunctions>(
    () => FirebaseFunctions.instance,
  );

  // GraphQLRepository
  gh.lazySingleton<GraphQLRepository>(
    () => GraphQLRepository(),
  );

  // ProductRepository
  gh.lazySingleton<ProductRepository>(
    () => ProductRepository(
      getIt.get<GraphQLRepository>(),
    ),
  );

  // CategoryRepository
  gh.lazySingleton<CategoryRepository>(
    () => CategoryRepository(
      getIt.get<GraphQLRepository>(),
    ),
  );
}
