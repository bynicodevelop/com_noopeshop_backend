import "package:com_noopeshop_backend/utils/form_generator.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  testWidgets("Doit générer un formulaire avec 1 champ", (
    WidgetTester tester,
  ) async {
    // ARRANGE
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            final FormGenerator formGenerator = FormGenerator(
              formData: [
                {
                  "field_name": "display_name",
                  "data_model": "displayName",
                  "label": "Display Name",
                  "field_type": "text_input",
                  "validator": (String value) =>
                      value.isEmpty ? "required" : null,
                },
              ],
              onError: () {},
              onSubmitted: (Map<String, dynamic> data) {},
            );

            return formGenerator.render();
          }),
        ),
      ),
    );

    // ACT
    // ASSERT
    expect(find.text("Display Name"), findsOneWidget);
  });

  testWidgets(
      "Doit afficher une notification d'erreur si certain champs ne sont pas remplis",
      (
    WidgetTester tester,
  ) async {
    // ARRANGE
    bool hasError = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            final FormGenerator formGenerator = FormGenerator(
              formData: [
                {
                  "field_name": "display_name",
                  "data_model": "displayName",
                  "label": "Display Name",
                  "field_type": "text_input",
                  "validator": (String value) =>
                      value.isEmpty ? "required" : null,
                },
              ],
              onError: () {
                hasError = true;
              },
              onSubmitted: (Map<String, dynamic> data) {},
            );

            return formGenerator.render();
          }),
        ),
      ),
    );

    // ACT
    await tester.tap(find.byType(ElevatedButton));

    await tester.pumpAndSettle();

    // ASSERT
    expect(hasError, isTrue);
  });
}
