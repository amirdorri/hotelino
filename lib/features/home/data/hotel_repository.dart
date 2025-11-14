import 'package:hotelino/model/home/HotelModel.dart';
import 'package:hotelino/shared/service/json_data_service.dart';

class HotelRepository {
  final JsonDataService jsonDataService;

  HotelRepository({required this.jsonDataService});

  Future<List<HotelModel>> fetchHotels() async {
    return jsonDataService.loadHotels();
  }

  Future<HotelModel> getHotelById(String id) {
    return jsonDataService.loadHotels().then(
            (hotels) {
          return hotels.firstWhere((element) => element.id == id);
        }
    );
  }
}
