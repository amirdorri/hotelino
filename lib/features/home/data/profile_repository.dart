import 'package:hotelino/model/home/profile/profile.dart';

class ProfileRepository {

  Future<Profile> fetchUserProfile() async {
    await Future.delayed(Duration(milliseconds: 100));
    return Profile(
      id: "7954862145",
      name: "کیان خاکی",
      email: "kiankhaki@gmail.com",
      avatarUrl: "https://dunijet.ir/content/projects/hotelino/profile_pic.png",
      phoneNumber: "+989123456789",
      location: "تهران، ایران",
      bio: "عاشق سفر و تجربه هتل‌های لاکچری 🌍✨",
      bookings: 12,
      favorites: 5,
      notifications: 3,
    );
  }
}