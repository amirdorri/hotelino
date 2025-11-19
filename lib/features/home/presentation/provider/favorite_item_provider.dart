import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/hotel_repository.dart';
import 'package:hotelino/model/home/HotelModel.dart';

class FavoriteItemProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  FavoriteItemProvider(this._hotelRepository) {
    fetchHotels();
  }

  List<HotelModel> _hotels = [];
  List<String> _favoriteHotelIds = [];

  List<HotelModel> get favoriteHotelList =>
      _hotels.where((hotel) => _favoriteHotelIds.contains(hotel.id)).toList();

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

  bool isFavorite(int hotelId) {
    return _favoriteHotelIds.contains(hotelId);
  }

  void toggleFavorite(String hotelId) {
    if (_favoriteHotelIds.contains(hotelId)) {
      _favoriteHotelIds.remove(hotelId);
    } else {
      _favoriteHotelIds.add(hotelId);
    }
    notifyListeners();
  }
}
