import "package:com_noopeshop_backend/components/forms/inputs/text/text_input_form_component.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  testWidgets("Doit valider les éléments du formulaire",
      (WidgetTester tester) async {
    // ARRANGE
    final ValueNotifier<String> controller = ValueNotifier("");
    bool hasError = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextInputFormComponent(
            controller: controller,
            label: "Name",
            hasError: (bool value) => hasError = value,
          ),
        ),
      ),
    );

    // ACT
    // ASSERT
    expect(find.text("Name"), findsOneWidget);
    expect(find.text("Error"), findsNothing);
    expect(hasError, isFalse);
  });

  testWidgets(
      "Doit afficher un message d'erreur quand le champs est vidé et que le focus est perdu",
      (WidgetTester tester) async {
    // ARRANGE
    final ValueNotifier<String> controller = ValueNotifier("");
    bool hasError = false;

    late BuildContext ctx;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              ctx = context;

              return TextInputFormComponent(
                controller: controller,
                label: "Name",
                hasError: (value) {
                  hasError = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "required";
                  }

                  return null;
                },
              );
            },
          ),
        ),
      ),
    );

    final textField = find.byType(TextField);

    await tester.tap(textField);

    // ACT
    expect(hasError, isFalse);
    expect(find.text("required"), findsNothing);

    FocusScope.of(ctx).unfocus();

    await tester.pumpAndSettle();

    // ASSERT
    expect(find.text("required"), findsOneWidget);
    expect(hasError, isTrue);
  });

  testWidgets(
      "Doit retourner un message d'erreur avec validateur avec minimum 3 caractères",
      (WidgetTester tester) async {
    // ARRANGE
    final ValueNotifier<String> controller = ValueNotifier("");
    bool hasError = false;

    late BuildContext ctx;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              ctx = context;

              return TextInputFormComponent(
                controller: controller,
                label: "Name",
                hasError: (value) {
                  hasError = value;
                },
                validator: (value) {
                  if (value.isEmpty && value.length < 3) {
                    return "3 caracters min.";
                  }

                  return null;
                },
              );
            },
          ),
        ),
      ),
    );

    final textField = find.byType(TextField);

    await tester.tap(textField);

    // ACT
    expect(hasError, isFalse);
    expect(find.text("3 caracters min."), findsNothing);

    FocusScope.of(ctx).unfocus();

    await tester.pumpAndSettle();

    // ASSERT
    expect(find.text("3 caracters min."), findsOneWidget);
    expect(hasError, isTrue);
  });
}
