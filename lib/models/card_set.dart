class CardSet {
  final String id;
  final String name;
  final String? logo;
  final String? symbol;

  CardSet({
    required this.id,
    required this.name,
    this.logo,
    this.symbol,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) {
    return CardSet(
      id: json['id'],
      name: json['name'],
      logo: json['logo'] as String?,
      symbol: json['symbol'] as String?,
    );
  }
}
