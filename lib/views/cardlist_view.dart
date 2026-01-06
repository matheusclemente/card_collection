import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cardlist_viewmodel.dart';

class CardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardListViewModel()..loadCards(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Collectible Cards'),
        ),
        body: Consumer<CardListViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (viewModel.errorMessage != null) {
              return Center(child: Text('Error: ${viewModel.errorMessage}'));
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: viewModel.cards.length,
              itemBuilder: (context, index) {
                final card = viewModel.cards[index];
                return ListTile(
                  title: Text(card.name),
                  subtitle: Text(card.image),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
