import 'package:flutter/material.dart';
import 'package:hotelino/features/onboarding/repository/onboarding_repo.dart';

class OnboardingProvider extends ChangeNotifier {
    final OnboardingRepo repository;

    OnboardingProvider(this.repository) {
        _loadData();
    }

    int currentPage = 0;
    List<Map<String, String>> onboardingData = [];

    void _loadData() {
        onboardingData = repository.onboardingData;
        notifyListeners();
    }

    void updateCurrentPage(int index) {
        currentPage = index;
        notifyListeners();
    }
}