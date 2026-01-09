import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/collectible_card.dart';
import '../viewmodels/carddetails_viewmodel.dart';

class CardDetailsView extends StatelessWidget {
  final CollectibleCard card;

  const CardDetailsView({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardDetailsViewModel()..loadCardDetails(card.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(card.name),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            Consumer<CardDetailsViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Column(children: [
                    Text("Loading Details..."),
                    LinearProgressIndicator()
                  ]);
                }

                if (viewModel.errorMessage != null) {
                  return Center(
                      child: Text('Error: ${viewModel.errorMessage}'));
                }

                return Column(
                  children: [
                    Row(
                      children: [
                        const Text("Illustrator: "),
                        viewModel.card?.illustratorName != null
                            ? TextButton(
                                onPressed: () {},
                                child: Text(viewModel.card!.illustratorName!))
                            : const Text('---'),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Set: "),
                        viewModel.card?.set?.name != null
                            ? TextButton(
                                onPressed: () {},
                                child: Text(viewModel.card!.set!.name))
                            : const Text('---'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
