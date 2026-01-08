import 'package:animate_do/animate_do.dart';
import 'package:blood_bank/features/auth/view/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/onboard/model/onboard_model.dart';

class OnboardPageTemplate extends StatefulWidget {
  const OnboardPageTemplate({super.key});

  @override
  State<OnboardPageTemplate> createState() => _OnboardPageTemplateState();
}

class _OnboardPageTemplateState extends State<OnboardPageTemplate> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLastPage = _currentIndex == onboardData.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button (Top Right)
            if (!isLastPage)
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: GestureDetector(
                    onTap: _skipOnboard,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemCount: onboardData.length,
                itemBuilder: (context, index) {
                  final onboard = onboardData[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Hero Image with Background
                        Container(
                          width: size.width * 0.7,
                          height: size.width * 0.7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Appthemes.primaryColor.withOpacity(0.1),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Outer Circle
                              Container(
                                width: size.width * 0.65,
                                height: size.width * 0.65,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Appthemes.primaryColor.withOpacity(
                                      0.2,
                                    ),
                                    width: 2,
                                  ),
                                ),
                              ),
                              // Image
                              Container(
                                width: size.width * 0.55,
                                height: size.width * 0.55,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(onboard.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 48),

                        // Title
                        FadeInUp(
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            onboard.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                              height: 1.2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Description
                        FadeInUp(
                          duration: const Duration(milliseconds: 550),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              onboard.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Bottom Section
            Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  // Page Indicator Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentIndex == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentIndex == index
                              ? Appthemes.primaryColor
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Next/Get Started Button
                  SizedBox(
                    width: isLastPage ? double.infinity : 64,
                    height: isLastPage ? 56 : 64,
                    child: Material(
                      borderRadius: BorderRadius.circular(isLastPage ? 28 : 32),
                      color: Appthemes.primaryColor,
                      child: InkWell(
                        onTap: isLastPage ? _navigateToHome : _moveToNextPage,
                        borderRadius: BorderRadius.circular(
                          isLastPage ? 28 : 32,
                        ),
                        child: Center(
                          child: isLastPage
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Get Started',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                )
                              : const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _moveToNextPage() {
    if (_currentIndex < onboardData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToHome();
    }
  }

  void _skipOnboard() {
    _navigateToHome();
  }

  void _navigateToHome() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => const SignUp()));
  }
}
