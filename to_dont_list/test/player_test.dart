import 'package:flutter_test/flutter_test.dart';
import 'package:to_dont_list/objects/player.dart';

void main() {
  test('new player starts unconfirmed', () {
    final player = Player(name: 'Fred');

    expect(player.name, 'Fred');
    expect(player.confirmed, false);
  });

  test('player can be created as confirmed', () {
    final player = Player(name: 'Fred', confirmed: true);

    expect(player.confirmed, true);
  });

  test('toggleConfirmed changes presence both ways', () {
    final player = Player(name: 'Fred');

    player.toggleConfirmed();
    expect(player.confirmed, true);

    player.toggleConfirmed();
    expect(player.confirmed, false);
  });
}
