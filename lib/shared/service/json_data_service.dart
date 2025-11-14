import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/model/HotelModel.dart';

class JsonDataService {

  Future<List<HotelModel>> loadHotels() async {
    final response = await rootBundle.loadString(AppConstants.hotelsData);
    final Map<String, dynamic> jsonData = json.decode(response);
    final List<dynamic> hotelList = jsonData["hotels"];
    return hotelList
        .map((hotel) => HotelModel.fromJson(hotel as Map<String, dynamic>))
        .toList();
  }
}
