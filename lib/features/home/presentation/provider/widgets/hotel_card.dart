import 'package:flutter/material.dart';
import 'package:hotelino/core/utils/network.dart';
import 'package:hotelino/core/utils/price_formatter.dart';
import 'package:hotelino/features/home/presentation/provider/favorite_item_provider.dart';
import 'package:hotelino/model/home/HotelModel.dart';
import 'package:provider/provider.dart';


class HotelCard extends StatelessWidget {
  final HotelModel hotel;

  const HotelCard({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {

    //final favoriteProvider = Provider.of<FavoriteItemProvider>(context);
    //final isFavorite = favoriteProvider.isFavorite(hotel.id as int,); //cast

    return SizedBox(
      width: 280,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  child: Image.network(
                    networkUrl(hotel.images[0]),
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   top: 8,
                //   right: 8,
                //   child: AnimatedFavoriteButton(
                //     isFavorite: isFavorite,
                //     onTap: () {
                //       favoriteProvider.toggleFavorite(hotel.id);
                //     },
                //   ),
                // ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(Icons.start, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '${hotel.rating} (${formatPrice(hotel.reviewCount)})',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Text(
                        hotel.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),

                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: 8),
                      Text(
                        '${hotel.city}, ${hotel.country}',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).colorScheme.primary,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                    ],
                  ),

                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      "از ${formatPrice(hotel.pricePerNight)} / شب",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "مشاهده و انتخاب اتاق",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//claude
// class HotelCard extends StatelessWidget {
//   final HotelModel hotel;
//
//   const HotelCard({super.key, required this.hotel});
//
//   @override
//   Widget build(BuildContext context) {
//
//     //final favoriteProvider = Provider.of<FavoriteItemProvider>(context);
//     //final isFavorite = favoriteProvider.isFavorite(hotel.id as int,); ////////////////cast
//
//     return SizedBox(
//       width: 280,
//       height: 360,
//       child: Card(
//         elevation: 4,
//         margin: EdgeInsets.zero,
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // بخش عکس - ارتفاع ثابت
//             SizedBox(
//               height: 160,
//               child: Image.network(
//                 networkUrl(hotel.images[0]),
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     color: Colors.grey[300],
//                     child: Icon(Icons.hotel, size: 50),
//                   );
//                 },
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Container(
//                     color: Colors.grey[200],
//                     child: Center(child: CircularProgressIndicator()),
//                   );
//                 },
//               ),
//             ),
//
//             // بخش اطلاعات - ارتفاع ثابت
//             SizedBox(
//               height: 200,
//               child: Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     // ردیف امتیاز و نام
//                     Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.amber, size: 20),
//                         SizedBox(width: 4),
//                         Text(
//                           "${hotel.rating} (${formatPrice(hotel.reviewCount)})",
//                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                         ),
//                         Spacer(),
//                         Expanded(
//                           child: Text(
//                             hotel.name,
//                             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.end,
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: 4),
//
//                     // موقعیت
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Flexible(
//                           child: Text(
//                             "${hotel.city}, ${hotel.country}",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         Icon(
//                           Icons.location_on,
//                           color: Theme.of(context).colorScheme.primary,
//                           size: 16,
//                         ),
//                       ],
//                     ),
//
//                     SizedBox(height: 8),
//
//                     // قیمت
//                     Text(
//                       "از ${formatPrice(hotel.pricePerNight)} / شب",
//                       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//
//                     Spacer(),
//
//                     // دکمه
//                     SizedBox(
//                       width: double.infinity,
//                       height: 40,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         child: Text(
//                           "مشاهده و انتخاب اتاق",
//                           style: TextStyle(color: Colors.white, fontSize: 12),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }