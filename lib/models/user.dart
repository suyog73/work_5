class User {
  final String name;
  final String gender;
  final String imageUrl;
  bool isLeftSwipe;
  bool isRightSwipe;

  User({
    this.isLeftSwipe = false,
    this.isRightSwipe = false,
    required this.gender,
    required this.imageUrl,
    required this.name,
  });
}
