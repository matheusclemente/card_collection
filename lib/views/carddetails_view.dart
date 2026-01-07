import 'package:flutter/material.dart';
import '../models/collectible_card.dart';

class CardDetailsView extends StatelessWidget {
  final CollectibleCard card;

  const CardDetailsView({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              card.imageUrlHighRes,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.image_not_supported));
              },
            ),
            const SizedBox(height: 16),
            Text('Illustrator: ${card.illustratorName}'),
          ],
        ),
      ),
    );
  }
}
