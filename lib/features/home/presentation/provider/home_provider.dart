import 'package:flutter/material.dart';
import 'package:hotelino/core/constants/constants.dart';
import 'package:hotelino/features/home/data/hotel_repository.dart';
import 'package:hotelino/model/home/HotelModel.dart';
import 'package:hotelino/model/home/home_screen_data.dart';

class HomeProvider extends ChangeNotifier {
  final HotelRepository _hotelRepository;

  HomeProvider(this._hotelRepository) {
    fetchHotels();
  }

  List<HotelModel> _hotels = [];
  List<HotelModel> get hotels => _hotels;

   final HomeScreenData _homePageData = HomeScreenDataConstants.homePageData;
  HomeScreenData get homeScreenData => _homePageData;
  
  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
    notifyListeners();
  }

   // Filter Methods ----------------------------------------------------------------------------------------------

  List<HotelModel> getPopularHotels() {
    return _hotels.where((hotel) => _homePageData.popular.contains(hotel.id)).toList();
  }

  List<HotelModel> getSpecialOffersHotels() {
    return _hotels.where((hotel) => _homePageData.specialOffers.contains(hotel.id)).toList();
  }

  List<HotelModel> getNewestHotels() {
    return _hotels.where((hotel) => _homePageData.newest.contains(hotel.id)).toList();
  }

  // Story Section ------------------------------------------------------------------------------------------------

  List<String> getStoryImages() {
    final shuffledHotels = List<HotelModel>.from(_hotels)..shuffle();
    return shuffledHotels.take(3).map((hotel) => hotel.images[0]).toList();
  }

  final List<String> _storyTitles = ["امکانات رفاهی کامل", "اقامت در قلب شهر", "لوکس ترین هتل ها"];

  List<String> get storyTitles => _storyTitles;
}

