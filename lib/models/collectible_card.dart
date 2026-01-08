import 'card_set.dart';

class CollectibleCard {
  final String id;
  final String name;
  final String? image;
  final String? illustrator;
  final CardSet? set;

  CollectibleCard({
    required this.id,
    required this.name,
    this.image,
    this.illustrator,
    this.set,
  });

  factory CollectibleCard.fromJson(Map<String, dynamic> json) {
    return CollectibleCard(
      id: json['id'],
      name: json['name'],
      image: json['image'] as String?,
      illustrator: json['illustrator'] as String?,
      set: json['set'] != null
          ? CardSet.fromJson(json['set'] as Map<String, dynamic>)
          : null,
    );
  }

  String get imageUrl => image != null ? '$image/low.webp' : '';
  String get imageUrlHighRes => image != null ? '$image/high.webp' : '';
  String get illustratorName => illustrator ?? '---';
}
