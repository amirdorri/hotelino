import 'package:flutter/material.dart';
import 'package:hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:hotelino/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:hotelino/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:hotelino/routes/app_routes.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    final onboardingData = onboardingProvider.onboardingData;
    final int totalPages = onboardingData.length;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: totalPages,
              onPageChanged: onboardingProvider.updateCurrentPage,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return OnboardingItem(
                  title: data["title"]!,
                  description: data["description"]!,
                  image: data["image"]!,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          buildPageIndicator(
            onboardingProvider.currentPage,
            totalPages,
            context,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingButton(
                  visible: onboardingProvider.currentPage > 0,
                  icon: Icons.arrow_back,
                  onPressed: () => _previousPage(),
                  backgroundColor: Colors.transparent,
                  iconColor: theme.colorScheme.primary,
                ),
                OnboardingButton(
                  visible: onboardingProvider.currentPage < totalPages - 1,
                  icon: Icons.arrow_forward,
                  onPressed: () => _nextPage(),
                  backgroundColor: theme.colorScheme.primary,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          if (totalPages > 1) ...[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1,
                child: child,
              ),
              child: onboardingProvider.currentPage == totalPages - 1
                  ? Padding(
                key: const ValueKey('finish_button'),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    },
                    child: const Text('بزن بریم'),
                  ),
                ),
              )
                  : const SizedBox(),

            ),
          ],

        ],
      ),
    );
  }

  void _previousPage() {
    final myProvider = Provider.of<OnboardingProvider>(context, listen: false);
    if (myProvider.currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  void _nextPage() {
    final myProvider = Provider.of<OnboardingProvider>(context, listen: false);
    if (myProvider.currentPage < myProvider.onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  Widget buildPageIndicator(
    int currentIndex,
    int totalPages,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentIndex == index ? 12 : 8,
          height: currentIndex == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}
