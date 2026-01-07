class CollectibleCard {
  final String id;
  final String name;
  final String? image;
  final String? illustrator;

  CollectibleCard({
    required this.id,
    required this.name,
    this.image,
    this.illustrator,
  });

  factory CollectibleCard.fromJson(Map<String, dynamic> json) {
    return CollectibleCard(
      id: json['id'],
      name: json['name'],
      image: json['image'] as String?,
      illustrator: json['illustrator'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'illustrator': illustrator,
      };

  String get imageUrl => image != null ? '$image/low.webp' : '';
  String get imageUrlHighRes => image != null ? '$image/high.webp' : '';
  String get illustratorName => illustrator ?? '---';
}
