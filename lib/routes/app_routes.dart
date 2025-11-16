import 'package:flutter/material.dart';
import 'package:hotelino/features/home/presentation/provider/home_screen.dart';
import 'package:hotelino/features/onboarding/presentation/onBoarding_screen.dart';
import 'package:hotelino/routes/main_bottom_nav.dart';

class AppRoutes {
  
  static const String home = '/';
  static const String hotelDetail = '/hotel-detail';
  static const String bookingForm = '/booking-form';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String onboarding = '/onboarding';

    static final Map<String, WidgetBuilder> routes = {
    onboarding: (ctx) => const OnboardingScreen(),
    home: (ctx) => const MainBottomNav()//HomeScreen()
  };
  
}