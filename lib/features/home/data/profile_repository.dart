import 'package:hotelino/model/profile/profile.dart';

class ProfileRepository {

  Future<Profile> fetchUserProfile() async {
    await Future.delayed(Duration(milliseconds: 100));
    return Profile(
      id: "7954862145",
      name: "سارا جهانی",
      email: "sarajahani@gmail.com",
        avatarUrl: "https://www.slate.com/content/dam/slate/blogs/browbeat/2014/03/07/td_monaghan.jpg.CROP.promo-large.jpg",
      phoneNumber: "+989123456789",
      location: "تهران، ایران",
      bio: "عاشق سفر و تجربه هتل‌های لاکچری 🌍✨",
      bookings: 12,
      favorites: 5,
      notifications: 3,
    );
  }
}