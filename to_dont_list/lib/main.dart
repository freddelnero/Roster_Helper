import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/player.dart';
import 'package:to_dont_list/widgets/player_tile.dart';
import 'package:to_dont_list/widgets/to_do_dialog.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Pickup Roster',
    home: ToDoList(),
  )); // MateriaApp
}

class ToDoList extends StatefulWidget {
  // StatefulWidget because the list of players can change
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() =>
      _ToDoListState(); // Create the state for the ToDoList widget
}

class _ToDoListState extends State<ToDoList> {
  // State class for the ToDoList widget
  final List<Player> players = [];
  bool showConfirmedOnly = false;

  void _handleNewPlayer(
    // Callback function to handle adding a new player
    String name,
    TextEditingController textController,
  ) {
    if (name.trim().isEmpty) return;

    setState(() {
      players.insert(0, Player(name: name.trim()));
      textController.clear();
    });
  }

  void _togglePlayer(Player player) {
    // Callback function to toggle the confirmed status of a player
    setState(() {
      player.toggleConfirmed();
    });
  }

  void _removePlayer(Player player) {
    // Callback function to remove a player from the list
    setState(() {
      players.remove(player);
    });
  }

  void _toggleFilter() {
    // Callback function to toggle the filter for showing only confirmed players
    setState(() {
      showConfirmedOnly = !showConfirmedOnly;
    });
  }

  @override
  Widget build(BuildContext context) {
    final confirmedCount = players.where((player) => player.confirmed).length;

    final visiblePlayers = showConfirmedOnly
        ? players.where((player) => player.confirmed).toList()
        : players;

    return Scaffold(
      appBar: AppBar(title: const Text('Pickup Roster')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Confirmed: $confirmedCount / ${players.length}',
                  ),
                ),
                TextButton(
                  onPressed: _toggleFilter,
                  child: Text(
                    showConfirmedOnly ? 'Show all' : 'Confirmed only',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: visiblePlayers.map((player) {
                return PlayerTile(
                  player: player,
                  onToggle: () => _togglePlayer(player),
                  onRemove: () => _removePlayer(player),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add player',
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => ToDoDialog(
              onListAdded: _handleNewPlayer,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
