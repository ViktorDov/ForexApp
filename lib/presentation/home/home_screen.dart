import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../glossary/glossary_page.dart';
import '../profile/profile_screen.dart';
import '../strategy/strategy_page.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_buttom_navbar.dart';
import 'advice_screen.dart';
import 'analystic_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: currentIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.backgraundColor,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    showIconButton: false,
                    leftIconPath: 'assets/logo/leftIcon.svg',
                    title: 'Советы трейдеров',
                    backgroundColor: AppColors.floatButtonColor,
                    textColor: Colors.white,
                    onLeftIconPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  const CustomSliderButton(),
                ],
              ),
            ),
            const StrategysPage(),
            const GlossaryScreen(),
            const ProfileScreen(),
          ],
        ),
        bottomNavigationBar: CustomNavBar(
          selectedIndex: currentIndex,
          onItemTapped: onItemTapped,
        ),
      ),
    );
  }
}

class CustomSliderButton extends StatefulWidget {
  const CustomSliderButton({super.key});

  @override
  State<CustomSliderButton> createState() => _CustomSliderButtonState();
}

enum SegmentType { advice, analytics }

class _CustomSliderButtonState extends State<CustomSliderButton> {
  bool isToggled = false;
  SegmentType _selectedSegment = SegmentType.advice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSlidingSegmentedControl<SegmentType>(
            initialValue: SegmentType.advice,
            isStretch: true,
            children: const {
              SegmentType.advice: Text(
                'Советы',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.floatButtonColor,
                ),
              ),
              SegmentType.analytics: Text(
                'Аналитика',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.floatButtonColor,
                ),
              ),
            },
            innerPadding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: AppColors.innactiveColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            thumbDecoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            onValueChanged: (value) {
              setState(() {
                _selectedSegment = value;
              });
            },
          ),
          _selectedSegment == SegmentType.advice
              ? const AdviceScreen()
              : const AnalysticScreen(),
        ],
      ),
    );
  }
}
