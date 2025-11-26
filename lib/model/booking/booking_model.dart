import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class BookingModel {
  String fullName;
  String destination;
  JalaliRange? checkInOutRangeDate;

  String numberOfGuests;
  String phoneNumber;

  BookingModel({
    this.fullName = '',
    this.destination = '',
    this.checkInOutRangeDate,
    this.numberOfGuests = '',
    this.phoneNumber = '',
  });
}
