import "package:cloud_functions/cloud_functions.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/common_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/mockito.dart";

import "../mocks/mock_firebase_functions.dart";

void main() {
  group("list", () {
    test(
        "Doit retourner une exception si tous les paramètres ne sont pas renseignés",
        () async {
      // ARRANGE
      final List<Map<String, dynamic>> datasets = [
        {
          "collection": null,
        },
        {
          "collection": "",
        },
      ];

      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final CommonRepository commonRepository = CommonRepository(
        firebaseFunctions,
      );

      // ACT
      // ASSERT
      for (Map<String, dynamic> dataset in datasets) {
        expect(
          () async {
            await commonRepository.list(dataset);
          },
          throwsA(
            isA<StandardException>()
                .having((e) => e.code, "code", "missing_parameters"),
          ),
        );
      }
    });

    test("Doit retourner une liste vide", () async {
      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final MockHttpsCallableResult mockHttpsCallableResult =
          MockHttpsCallableResult<dynamic>();

      final HttpsCallable httpsCallable = MockHttpsCallable();

      when(firebaseFunctions.httpsCallable("listCommon"))
          .thenReturn(httpsCallable);

      when(httpsCallable.call({
        "collection": "users",
      })).thenAnswer((_) async {
        return mockHttpsCallableResult;
      });

      when(mockHttpsCallableResult.data).thenReturn({
        "result": "success",
        "data": [],
      });

      final CommonRepository commonRepository = CommonRepository(
        firebaseFunctions,
      );

      // ACT
      final Map<String, dynamic> result = await commonRepository.list({
        "collection": "users",
      });

      // ASSERT
      expect(result["result"], "success");
      expect(result["data"], []);
    });

    test("Doit retourner une liste de data", () async {
      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final MockHttpsCallableResult mockHttpsCallableResult =
          MockHttpsCallableResult<dynamic>();

      final HttpsCallable httpsCallable = MockHttpsCallable();

      when(firebaseFunctions.httpsCallable("listCommon"))
          .thenReturn(httpsCallable);

      when(httpsCallable.call({
        "collection": "users",
      })).thenAnswer((_) async {
        return mockHttpsCallableResult;
      });

      when(mockHttpsCallableResult.data).thenReturn({
        "result": "success",
        "data": [
          {
            "uid": "uid",
            "name": "name",
          },
        ],
      });

      final CommonRepository commonRepository = CommonRepository(
        firebaseFunctions,
      );

      // ACT
      final Map<String, dynamic> result = await commonRepository.list({
        "collection": "users",
      });

      // ASSERT
      expect(result["result"], "success");
      expect(result["data"], [
        {
          "uid": "uid",
          "name": "name",
        },
      ]);
    });
  });

  group("create", () {
    test(
        "Doit retourner un exception si toutes les données ne sont pas renseignées",
        () {
      // ARRANGE
      final List<Map<String, dynamic>> datasets = [
        {
          "collection": null,
        },
        {
          "collection": "",
        },
        {
          "data": null,
        },
        {
          "data": "",
        },
        {
          "collection": null,
          "data": null,
        },
        {
          "collection": "",
          "data": "",
        },
        {
          "collection": null,
          "data": [],
        },
        {
          "collection": "",
          "data": [],
        },
      ];

      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final CommonRepository commonRepository = CommonRepository(
        firebaseFunctions,
      );

      // ACT
      // ASSERT
      for (Map<String, dynamic> dataset in datasets) {
        expect(
          () async {
            await commonRepository.create(dataset);
          },
          throwsA(
            isA<StandardException>()
                .having((e) => e.code, "code", "missing_parameters"),
          ),
        );
      }
    });

    test("Doit d'ajouter de la données par le biais de l'API", () async {
      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final MockHttpsCallableResult mockHttpsCallableResult =
          MockHttpsCallableResult<dynamic>();

      final HttpsCallable httpsCallable = MockHttpsCallable();

      when(firebaseFunctions.httpsCallable("createCommon"))
          .thenReturn(httpsCallable);

      when(httpsCallable.call({
        "collection": "users",
        "data": [
          {
            "name": "name",
          },
        ],
      })).thenAnswer((_) async {
        return mockHttpsCallableResult;
      });

      when(mockHttpsCallableResult.data).thenReturn({
        "result": "success",
        "data": [
          {
            "uid": "uid",
            "name": "name",
          },
        ],
      });

      final CommonRepository commonRepository = CommonRepository(
        firebaseFunctions,
      );

      // ACT
      await commonRepository.create({
        "collection": "users",
        "data": [
          {
            "name": "name",
          },
        ],
      });

      // ASSERT
      verify(httpsCallable.call({
        "collection": "users",
        "data": [
          {
            "name": "name",
          },
        ],
      }));
    });
  });

  test("Doit d'ajouter de la données (objet) par le biais de l'API", () async {
    // ARRANGE
    final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

    final MockHttpsCallableResult mockHttpsCallableResult =
        MockHttpsCallableResult<dynamic>();

    final HttpsCallable httpsCallable = MockHttpsCallable();

    when(firebaseFunctions.httpsCallable("createCommon"))
        .thenReturn(httpsCallable);

    when(httpsCallable.call({
      "collection": "users",
      "data": [
        {
          "name": "name",
        },
      ],
    })).thenAnswer((_) async {
      return mockHttpsCallableResult;
    });

    when(mockHttpsCallableResult.data).thenReturn({
      "result": "success",
      "data": [
        {
          "uid": "uid",
          "name": "name",
        },
      ],
    });

    final CommonRepository commonRepository = CommonRepository(
      firebaseFunctions,
    );

    // ACT
    await commonRepository.create({
      "collection": "users",
      "data": {
        "name": "name",
      },
    });

    // ASSERT
    verify(httpsCallable.call({
      "collection": "users",
      "data": [
        {
          "name": "name",
        },
      ],
    }));
  });

  group("delete", () {
    test(
        "Doit retourner une exception si tous les paramètres ne sont pas renseignés",
        () async {
      final List<Map<String, dynamic>> datasets = [
        {
          "uid": null,
        },
        {
          "uid": "",
        },
        {
          "collection": "",
        },
        {
          "collection": null,
        },
        {
          "uid": "",
          "collection": "",
        },
        {
          "uid": null,
          "collection": null,
        },
      ];

      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final CommonRepository commonRepository = CommonRepository(
        firebaseFunctions,
      );

      // ACT
      // ASSERT
      for (Map<String, dynamic> dataset in datasets) {
        expect(
          () async {
            await commonRepository.delete(dataset);
          },
          throwsA(
            isA<StandardException>()
                .having((e) => e.code, "code", "missing_parameters"),
          ),
        );
      }
    });

    test("Doit la suppression d'une donnée par le biais de l'API", () async {
      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final MockHttpsCallableResult mockHttpsCallableResult =
          MockHttpsCallableResult<dynamic>();

      final HttpsCallable httpsCallable = MockHttpsCallable();

      when(firebaseFunctions.httpsCallable("deleteCommon"))
          .thenReturn(httpsCallable);

      when(httpsCallable.call({
        "collection": "users",
        "uid": "userId",
      })).thenAnswer((_) async {
        return mockHttpsCallableResult;
      });

      when(mockHttpsCallableResult.data).thenReturn({
        "result": "success",
      });

      final CommonRepository commonRepository = CommonRepository(
        firebaseFunctions,
      );

      // ACT
      await commonRepository.delete({
        "collection": "users",
        "uid": "userId",
      });

      // ASSERT
      verify(firebaseFunctions.httpsCallable("deleteCommon"));
    });

    test("Doit la suppression d'une donnée par le biais de l'API", () async {
      // ARRANGE
      final FirebaseFunctions firebaseFunctions = MockFirebaseFunctions();

      final MockHttpsCallableResult mockHttpsCallableResult =
          MockHttpsCallableResult<dynamic>();

      final HttpsCallable httpsCallable = MockHttpsCallable();

      when(firebaseFunctions.httpsCallable("deleteCommon"))
          .thenReturn(httpsCallable);

      when(httpsCallable.call({
        "collection": "users",
        "uid": "userId",
      })).thenAnswer((_) async {
        return mockHttpsCallableResult;
      });

      when(mockHttpsCallableResult.data).thenReturn({
        "result": "error",
        "reason": "unexpected_error",
      });

      final CommonRepository commonRepository = CommonRepository(
        firebaseFunctions,
      );

      // ACT
      // ASSERT
      expect(
        () async {
          await commonRepository.delete({
            "collection": "users",
            "uid": "userId",
          });
        },
        throwsA(
          isA<StandardException>()
              .having((e) => e.code, "code", "unexpected_error"),
        ),
      );
    });
  });
}
