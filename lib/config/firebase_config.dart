import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_functions/cloud_functions.dart";
import "package:com_noopeshop_backend/firebase_options.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_storage/firebase_storage.dart";

Future<void> configureFirebase(
  String environment,
) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (environment == "development") {
    final String host = Platform.isAndroid ? "10.0.2.2" : "localhost";

    await FirebaseAuth.instance.useAuthEmulator(
      host,
      9099,
    );

    FirebaseFirestore.instance.useFirestoreEmulator(
      host,
      8080,
    );

    FirebaseStorage.instance.useStorageEmulator(
      host,
      9199,
    );

    FirebaseFunctions.instance.useFunctionsEmulator(
      host,
      5001,
    );
  }

  await FirebaseFirestore.instance.terminate();
  await FirebaseFirestore.instance.clearPersistence();
}
