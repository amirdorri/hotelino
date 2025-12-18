

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
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'امکانات رفاهی',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: textTheme.headlineSmall,
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 14,
                        children: hotel.amenities.map((a) {
                          IconData icon;
                          switch (a) {
                            case 'ساحل':
                              icon = Icons.beach_access;
                              break;

                            case 'استخر':
                              icon = Icons.pool;
                              break;

                            case 'باشگاه':
                              icon = Icons.fitness_center;
                              break;

                            case 'کافه':
                              icon = Icons.restaurant;
                              break;

                            case 'رستوران':
                              icon = Icons.restaurant;
                              break;

                            case 'کولر':
                              icon = Icons.ac_unit;
                              break;

                            default:
                              icon = Icons.check_circle_outline;
                          }
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  icon,
                                  size: 30,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                a,
                                style: textTheme.bodySmall!.copyWith(color: Colors.black87),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          );
                        },
                        ).toList(), //end of Map
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

