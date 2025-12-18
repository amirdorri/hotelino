
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/price_formatter.dart';
import 'package:hotelino/features/hotel_detail/presentaion/HotelDetailScreen.dart';
import 'package:hotelino/model/home/HotelModel.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HotelCardVertical extends StatelessWidget {
  final HotelModel hotel;

  const HotelCardVertical({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    int i = Random().nextInt(14) + 1;
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          withNavBar: true,
          screen: HotelDetailScreen(hotelId: hotel.id, imagePath: "assets/images/hotel_pics/hotel_pic$i.jpg",),
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            if (Theme.of(context).brightness == Brightness.light)
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 6,
                spreadRadius: 2,
              )
            else
              BoxShadow(
                color: Theme.of(context).colorScheme.surfaceContainerHigh.withValues(alpha: 1),
                blurRadius: 6,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 12),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("رزرو اتاق", style: TextStyle(color: Colors.white)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 4),
                    Text(hotel.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${hotel.city}, ${hotel.country}",
                        ),
                        const SizedBox(width: 5),
                        Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary, size: 18),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Text("${hotel.bedType.count} ${hotel.bedType.type}"),
                        Text(
                          "${hotel.bedType.count} ${hotel.bedType.details}",
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(width: 5),
                        Icon(Icons.bed, color: Theme.of(context).colorScheme.primary, size: 18),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text("از ${formatPrice(hotel.pricePerNight)} / شب",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Image.asset(
                "assets/images/hotel_pics/hotel_pic$i.jpg",
                width: 100,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}