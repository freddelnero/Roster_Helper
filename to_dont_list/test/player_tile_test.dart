import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_dont_list/objects/player.dart';
import 'package:to_dont_list/widgets/player_tile.dart';

void main() {
  testWidgets('shows an unconfirmed player', (tester) async {
    final player = Player(
        name:
            'Brasil'); // Create a new Player object with the name 'Brasil' and default confirmed status (false)

    await tester.pumpWidget(
      // Build the widget tree for testing
      MaterialApp(
        home: Scaffold(
          body: PlayerTile(
            player: player,
            onToggle:
                () {}, // Callback for when the player is tapped (empty function for testing)
            onRemove:
                () {}, // Callback for when the remove button is pressed (empty function for testing)
          ),
        ),
      ),
    );

    expect(find.text('Brasil'), findsOneWidget);
    expect(find.text('Not confirmed'), findsOneWidget);
    expect(find.byIcon(Icons.radio_button_unchecked), findsOneWidget);
  });

  testWidgets('shows a confirmed player', (tester) async {
    final player = Player(name: 'Brasil', confirmed: true);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PlayerTile(
            player: player,
            onToggle: () {},
            onRemove: () {},
          ),
        ),
      ),
    );

    expect(find.text('Confirmed'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  testWidgets('calls onToggle when player is tapped', (tester) async {
    final player = Player(name: 'Brasil');
    var taps = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PlayerTile(
            player: player,
            onToggle: () => taps++,
            onRemove: () {},
          ),
        ),
      ),
    );

    await tester.tap(find.text('Brasil'));
    expect(taps, 1);
  });

  testWidgets('calls onRemove when delete button is tapped', (tester) async {
    final player = Player(name: 'Brasil');
    var removals = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PlayerTile(
            player: player,
            onToggle: () {},
            onRemove: () => removals++,
          ),
        ),
      ),
    );

    await tester.tap(find.byTooltip('Remove Brasil'));
    expect(removals, 1);
  });
}
