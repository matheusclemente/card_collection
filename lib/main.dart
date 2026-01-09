import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/cardlist_view.dart';
import 'viewmodels/cardlist_viewmodel.dart';
import 'viewmodels/carddetails_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CardListViewModel()),
        ChangeNotifierProvider(create: (_) => CardDetailsViewModel()),
      ],
      child: const MaterialApp(
        home: CardListView(),
      ),
    );
  }
}
