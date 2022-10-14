import "package:com_noopeshop_backend/components/menu/screen/screen_menu_component.dart";
import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  testWidgets("Doit contenir 1 elevated button", (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ScreenMenuComponent(
          actions: [
            ElevatedButton(
              onPressed: null,
              child: Text("Add"),
            ),
          ],
        ),
      ),
    ));

    // ACT
    final Finder elevatedButtonFinder = find.byType(ElevatedButton);

    // ASSERT
    expect(elevatedButtonFinder, findsOneWidget);
  });

  testWidgets("Doit contenir 2 elevated button", (WidgetTester tester) async {
    // ARRANGE
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ScreenMenuComponent(
          actions: [
            ElevatedButton(
              onPressed: null,
              child: Text("Add"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Add"),
            ),
          ],
        ),
      ),
    ));

    // ACT
    final Finder elevatedButtonFinder = find.byType(ElevatedButton);

    // ASSERT
    expect(elevatedButtonFinder, findsNWidgets(2));
  });
}
