import "package:com_noopeshop_backend/components/forms/inputs/email/email_input_form_component.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

main() {
  testWidgets("Doit valider les éléments du formulaire", (
    WidgetTester tester,
  ) async {
    // ARRANGE
    final TextEditingController controller = TextEditingController();
    bool hasError = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmailInputFormComponent(
            controller: controller,
            label: "Email",
            hasError: (bool value) => hasError = value,
          ),
        ),
      ),
    );

    // ACT
    // ASSERT
    expect(find.text("Email"), findsOneWidget);
    expect(find.text("Error"), findsNothing);
    expect(hasError, isFalse);
  });

  testWidgets("Doit une erreur quand le champs perd le focus et un valeur vide",
      (
    WidgetTester tester,
  ) async {
    // ARRANGE
    final TextEditingController controller = TextEditingController();
    bool hasError = false;

    late BuildContext ctx;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            ctx = context;

            return EmailInputFormComponent(
              controller: controller,
              label: "Email",
              hasError: (bool value) => hasError = value,
              validator: (String value) {
                if (value.isEmpty) {
                  return "required";
                }

                return null;
              },
            );
          }),
        ),
      ),
    );

    final textField = find.byType(TextField);

    await tester.tap(textField);

    // ACT
    expect(find.text("required"), findsNothing);
    expect(hasError, isFalse);

    FocusScope.of(ctx).unfocus();

    await tester.pumpAndSettle();

    // ASSERT
    expect(find.text("required"), findsOneWidget);
    expect(hasError, isTrue);
  });

  testWidgets("Doit retourner une erreur si l'email renseigné n'est pas valide",
      (WidgetTester tester) async {
    // ARRANGE
    final TextEditingController controller = TextEditingController();
    bool hasError = false;

    late BuildContext ctx;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            ctx = context;

            return EmailInputFormComponent(
              controller: controller,
              label: "Email",
              hasError: (bool value) => hasError = value,
            );
          }),
        ),
      ),
    );

    // Enter text
    await tester.enterText(find.byType(TextField), "invalid");

    await tester.pumpAndSettle();

    // ACT
    expect(find.text("invalid email"), findsNothing);
    expect(hasError, isFalse);

    FocusScope.of(ctx).unfocus();

    await tester.pumpAndSettle();

    // ASSERT
    expect(find.text("invalid email"), findsOneWidget);
    expect(hasError, isTrue);
  });
}
