import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hotelino/core/theme/app_theme.dart';
import 'package:hotelino/core/theme/theme_provider.dart';
import 'package:hotelino/features/home/data/hotel_repository.dart';
import 'package:hotelino/features/home/data/profile_repository.dart';
import 'package:hotelino/features/home/presentation/provider/favorite_item_provider.dart';
import 'package:hotelino/features/home/presentation/provider/home_provider.dart';
import 'package:hotelino/features/home/presentation/provider/profile_provider.dart';
import 'package:hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:hotelino/features/onboarding/repository/onboarding_repo.dart';
import 'package:hotelino/routes/app_routes.dart';
import 'package:hotelino/shared/service/json_data_service.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

import 'bootstrap.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  lazyBootstrap();
  FlutterNativeSplash.remove();
  final hotelRepo = HotelRepository(jsonDataService: JsonDataService());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(WidgetsBinding.instance.platformDispatcher.platformBrightness,
          ),
        ),
        ChangeNotifierProvider(create: (_)=> OnboardingProvider(OnboardingRepo())),
        ChangeNotifierProvider(create: (_)=> HomeProvider(hotelRepo)),
        ChangeNotifierProvider(create: (_)=> ProfileProvider(ProfileRepository(), hotelRepo)),
        ChangeNotifierProvider(create: (_)=> FavoriteItemProvider(hotelRepo)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    Provider.of<ThemeProvider>(
      context,
      listen: false,
    ).updateBrightness(brightness);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeModeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hotelino',
          locale: const Locale("fa", "IR"),
          supportedLocales: const [Locale("fa", "IR"), Locale("en", "US")],
          localizationsDelegates: [
            PersianMaterialLocalizations.delegate,
            PersianCupertinoLocalizations.delegate,
          ],
          routes: AppRoutes.routes,
          initialRoute: AppRoutes.onboarding,
          theme: themeModeProvider.brightness == Brightness.light ? AppTheme
              .lightTheme : AppTheme.darkTheme,
        );

        // return MaterialApp(
        //   debugShowCheckedModeBanner: false,
        //   theme: ThemeData(colorSchemeSeed: Colors.red),
        //   home: BottomNavigation(),
        // );
      },
    );
  }
}
