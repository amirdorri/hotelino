

import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/hotel_repository.dart';
import 'package:hotelino/model/home/HotelModel.dart';
import 'package:hotelino/shared/service/json_data_service.dart';

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({super.key, required this.hotelId});
  final String hotelId;

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
        return Scaffold();


      },
    );
  }
}

