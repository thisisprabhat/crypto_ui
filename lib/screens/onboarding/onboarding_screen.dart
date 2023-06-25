import 'package:crypto_app/screens/homescreen/home_screen.dart';
import 'package:crypto_app/screens/widgets/animated_blured_background.dart';
import 'package:crypto_app/utils/style.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedBluredBackground(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(paddingDefault / 2),
                child: TextButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false),
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: colorScheme.primaryContainer,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) => setState(() => _currentIndex = value),
                children: _listOfOnboardingItems,
              ),
            ),
            _pageViewIndicatorDots,
            const SizedBox(height: paddingDefault * 4),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: 50,
                  minWidth: MediaQuery.of(context).size.width * 0.9),
              child: ElevatedButton(
                child: Text(_currentIndex < _listOfOnboardingItems.length - 1
                    ? "Next"
                    : "Continue"),
                onPressed: () {
                  if (_currentIndex < _listOfOnboardingItems.length - 1) {
                    _pageController.animateToPage(++_currentIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linearToEaseOut);
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false);
                  }
                },
              ),
            ),
            const SizedBox(height: paddingDefault),
          ],
        ),
      ),
    );
  }

  Row get _pageViewIndicatorDots => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _listOfOnboardingItems.length,
          (index) => GestureDetector(
            onTap: () => _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linearToEaseOut),
            child: Container(
              height: 10,
              width: _currentIndex == index ? 40 : 10,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: _currentIndex == index
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onPrimary.withOpacity(0.3),
                borderRadius: borderRadius,
              ),
            ),
          ),
        ),
      );

  List<Widget> get _listOfOnboardingItems => [
        _onboardingItem(
          imagePath: "assets/images/multiple_currencies.png",
          title: "Multiple Cryptocurrencies",
          subtitle:
              "After creating an account, users can manage multiple digital currenies",
        ),
        _onboardingItem(
          width: 280,
          imagePath: "assets/images/currency_details.png",
          title: "Details of Currencies",
          subtitle:
              "User can see complete details of a crypto currency and precise information about it",
        ),
        _onboardingItem(
          width: 280,
          imagePath: "assets/images/currency_converter.png",
          title: "Currency Converter",
          subtitle:
              "After creating an account, users can manage multiple digital currenies",
        ),
      ];

  Padding _onboardingItem(
      {required String imagePath,
      required String title,
      String subtitle = "",
      double? width}) {
    return Padding(
      padding: const EdgeInsets.all(paddingDefault * 2),
      child: Column(
        children: [
          const SizedBox(height: paddingDefault * 2),
          Image.asset(
            imagePath,
            width: width ?? double.maxFinite,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: paddingDefault * 2),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: paddingDefault),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
