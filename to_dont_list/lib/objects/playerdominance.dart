// this class just represents a person and their dominant hand, they are initially right-handed, but can change to left-handed and back again.
// the class also has a method to return the first letter of the name in uppercase.

class Person {
  Person({
    required this.name,
    this.isLeftHanded = false,
  });

  final String name;
  bool isLeftHanded;

  String abbrev() {
    return name.substring(0, 1).toUpperCase();
  }

  String dominantHand() {
    return isLeftHanded ? "Left-handed" : "Right-handed";
  }

  void changeDominantHand() {
    isLeftHanded = !isLeftHanded;
  }
}
