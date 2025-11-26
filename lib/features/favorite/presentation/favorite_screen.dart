import 'package:flutter/material.dart';
import 'package:hotelino/features/home/presentation/provider/widgets/search_bar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'هتل های مورد علاقه',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             const SizedBox(height: 16),
            const SearchBarWidget(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}