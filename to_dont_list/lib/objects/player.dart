class Player {
  Player({required this.name, this.confirmed = false});

  final String name; //name of the player
  bool confirmed; //gonna play or not

  void toggleConfirmed() {
    confirmed = !confirmed;
  }
}
