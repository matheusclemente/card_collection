class Card {
  final String id;
  final String image;
  final String name;
  final String illustrator;

  Card({
    required this.id,
    required this.image,
    required this.name,
    this.illustrator = 'Unknown',
  });
}
