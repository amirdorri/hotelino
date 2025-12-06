import 'package:flutter/material.dart';
import 'package:hotelino/features/favorite/presentation/widgets/favorite_item.dart';
import 'package:hotelino/features/home/presentation/provider/favorite_item_provider.dart';
import 'package:hotelino/features/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/features/home/presentation/provider/widgets/hotel_list_section.dart';
import 'package:hotelino/features/home/presentation/provider/widgets/search_bar.dart';
import 'package:provider/provider.dart';

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
            Consumer<FavoriteItemProvider>(
              builder: (context, favoriteProvider, child) {
                return ListView.builder(
                  itemCount: favoriteProvider.favoriteHotelList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsetsGeometry.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      child: FavoriteHotelCard(
                        hotel: favoriteProvider.favoriteHotelList[index],
                        onRemoveFavoriteClicked: (hotelId) {
                          favoriteProvider.toggleFavorite(hotelId);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                if(profileProvider.recentlyViewedHotels.isNotEmpty){
                  return HotelListSection(title: 'بازدید های اخیر', hotels: profileProvider.recentlyViewedHotels);
                }else{
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
