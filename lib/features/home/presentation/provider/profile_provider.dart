import 'package:flutter/material.dart';
import 'package:hotelino/features/home/data/hotel_repository.dart';
import 'package:hotelino/features/home/data/profile_repository.dart';
import 'package:hotelino/model/home/HotelModel.dart';
import 'package:hotelino/model/home/profile/profile.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _profileRepository;
  final HotelRepository _hotelRepository;
  List<HotelModel> _hotels = [];
  Profile? _profile;
  Profile? get profile => _profile;

  ProfileProvider(this._profileRepository, this._hotelRepository) {
    fetchHotels();
    fetchUserProfile();
  }

  fetchUserProfile() async {
    _profile = await _profileRepository.fetchUserProfile();
    notifyListeners();
  }

  fetchHotels() async {
    _hotels = await _hotelRepository.fetchHotels();
  }

  // recently viewed hotels
  final List<String> _recentlyViewedHotels = [];

  List<HotelModel> get recentlyViewedHotels => _hotels
      .where((element) => _recentlyViewedHotels.contains(element.id))
      .toList();

  void addRecentlyViewed(String hotelId) {
    if (!recentlyViewedHotels.contains(hotelId)) {
      _recentlyViewedHotels.add(hotelId);
      notifyListeners();
    } else {
      _recentlyViewedHotels.remove(hotelId);
      _recentlyViewedHotels.add(hotelId);
      notifyListeners();
    }
  }

}
