class CollectibleCard {
  final String id;
  final String image;
  final String name;
  final String illustrator;

  CollectibleCard({
    required this.id,
    this.image = "",
    required this.name,
    this.illustrator = 'Unknown',
  });

  CollectibleCard.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        image = json['image'] as String? ?? "",
        name = json['name'] as String,
        illustrator = json['illustrator'] as String? ?? 'Unknown';

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'illustrator': illustrator,
      };

  String get imageUrl => '$image/low.webp';
}
