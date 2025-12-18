

import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/features/home/data/hotel_repository.dart';
import 'package:hotelino/model/home/HotelModel.dart';
import 'package:hotelino/shared/service/json_data_service.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

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
              elevation: 8,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: GestureDetector(
                  onLongPress: (){},
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              leading: BackButton(
                onPressed: (){
                  PersistentNavBarNavigator.pop(context);
                },
                color: Colors.white,
              ),
            ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hotel.name,
                        style: textTheme.headlineMedium,
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              hotel.address,
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.location_on,
                            color:Colors.grey ,
                          ),

                        ],
                      )
                    ],
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

