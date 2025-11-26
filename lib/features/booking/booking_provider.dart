
import 'package:flutter/foundation.dart';
import 'package:hotelino/model/booking/booking_model.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingProvider with ChangeNotifier {
  final BookingModel _booking = BookingModel();

  BookingModel get booking => _booking;

  void setName(String newName) {
    _booking.fullName = newName;
    notifyListeners();
  }

  void setDestination(String value) {
    _booking.destination = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _booking.phoneNumber = value;
    notifyListeners();
  }

  void setNumberOfGuests(String value) {
    _booking.numberOfGuests = value;
    notifyListeners();
  }

  void setDateRange(JalaliRange value) {
    _booking.checkInOutRangeDate = value;
    notifyListeners();
  }
}
