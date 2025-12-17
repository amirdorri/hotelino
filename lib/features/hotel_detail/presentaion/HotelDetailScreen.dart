

import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/features/home/data/hotel_repository.dart';
import 'package:hotelino/model/home/HotelModel.dart';
import 'package:hotelino/shared/service/json_data_service.dart';

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({super.key, required this.hotelId, required this.imagePath});
  final String hotelId;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final hotelRepository = HotelRepository(jsonDataService: JsonDataService());
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<HotelModel>(
      future: hotelRepository.getHotelById(hotelId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final hotel = snapshot.data!;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: GestureDetector(
                  onLongPress: (){},
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            ],
          ),
        );


      },
    );
  }
}

