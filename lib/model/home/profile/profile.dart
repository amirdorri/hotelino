class Profile {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String phoneNumber;
  final String location;
  final String bio;
  final int bookings;
  final int favorites;
  final int notifications;

  Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.phoneNumber,
    required this.location,
    required this.bio,
    required this.bookings,
    required this.favorites,
    required this.notifications,
  });

}