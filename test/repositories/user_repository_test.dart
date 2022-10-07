import "package:cloud_functions/cloud_functions.dart";
import "package:com_noopeshop_backend/repositories/user_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/mockito.dart";

import "../mocks/mock_firebase_functions.dart";

void main() {
  group("list", () {
    test("Doit retourner une liste des comptes utilisateurs", () async {
      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final MockHttpsCallableResult mockHttpsCallableResult =
          MockHttpsCallableResult<dynamic>();

      final HttpsCallable httpsCallable = MockHttpsCallable();

      when(firebaseFunctions.httpsCallable("listUser"))
          .thenReturn(httpsCallable);

      when(httpsCallable.call()).thenAnswer((_) async {
        return mockHttpsCallableResult;
      });

      when(mockHttpsCallableResult.data).thenReturn([
        {
          "id": "1",
          "email": "john@domain.tld",
          "displayName": "John Doe",
          "photoURL": "https://domain.tld/john.png",
          "phoneNumber": "+33612345678",
          "emailVerified": true,
          "disabled": false,
        },
      ]);

      final UserRepository userRepository = UserRepository(
        firebaseFunctions,
      );

      // ACT
      final List<Map<String, dynamic>> users = await userRepository.list();

      // ASSERT
      expect(users.length, 1);
    });

    test("Doit retourner une liste vide des comptes utilisateurs", () async {
      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final MockHttpsCallableResult mockHttpsCallableResult =
          MockHttpsCallableResult();

      final HttpsCallable httpsCallable = MockHttpsCallable();

      when(firebaseFunctions.httpsCallable("listUser"))
          .thenReturn(httpsCallable);

      when(httpsCallable.call()).thenAnswer((_) async {
        return mockHttpsCallableResult;
      });

      when(mockHttpsCallableResult.data).thenReturn([]);

      final UserRepository userRepository = UserRepository(
        firebaseFunctions,
      );

      // ACT
      final List<Map<String, dynamic>> users = await userRepository.list();

      // ASSERT
      expect(users, isEmpty);
    });
  });

  group("createt", () {
    test("Doit permettre la création d'un compte utilisateur", () async {
      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final MockHttpsCallableResult mockHttpsCallableResult =
          MockHttpsCallableResult();

      final HttpsCallable httpsCallable = MockHttpsCallable();

      when(firebaseFunctions.httpsCallable("createUser"))
          .thenReturn(httpsCallable);

      when(httpsCallable.call(<String, dynamic>{
        "email": "john@domain.tld",
        "displayName": "John Doe",
      })).thenAnswer((_) async => Future.value(mockHttpsCallableResult));

      final UserRepository userRepository = UserRepository(
        firebaseFunctions,
      );

      // ACT
      await userRepository.create(<String, dynamic>{
        "email": "john@domain.tld",
        "displayName": "John Doe",
      });

      // ASSERT
      verify(httpsCallable.call(<String, dynamic>{
        "email": "john@domain.tld",
        "displayName": "John Doe",
      }));
    });
  });
}
