import 'package:flutter/material.dart';
import '../objects/player.dart';

class PlayerTile extends StatelessWidget {
  const PlayerTile({
    super.key,
    required this.player, // The player object to display
    required this.onToggle, // Callback for when the player is tapped
    required this.onRemove, // Callback for when the remove button is pressed
  });

  final Player player;
  final VoidCallback onToggle;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        player.confirmed ? Icons.check_circle : Icons.radio_button_unchecked,
        color: player.confirmed ? Colors.green : Colors.grey,
      ),
      title: Text(player.name),
      subtitle: Text(player.confirmed ? 'Confirmed' : 'Not confirmed'),
      onTap: onToggle,
      trailing: IconButton(
        tooltip: 'Remove ${player.name}',
        icon: const Icon(Icons.delete_outline),
        onPressed: onRemove,
      ),
    );
  }
}
