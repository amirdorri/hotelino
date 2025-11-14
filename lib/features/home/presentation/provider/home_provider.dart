import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/hotel_repository.dart';
import 'package:hotelino/model/home/HotelModel.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  HomeProvider(this._hotelRepository) {
    fetchHotels();
  }

  List<HotelModel> _hotels = [];
  List<HotelModel> get hotels => _hotels;
  
  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }
}
