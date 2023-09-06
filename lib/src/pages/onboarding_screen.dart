import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/img_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnboardContent(
                  image: demoData[index].image,
                  title: demoData[index].title,
                  description: demoData[index].description,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: demoData.length,
                        effect: const ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                      SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.blueGrey.shade800),
                            onPressed: () => {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn)
                            },
                            child: const Icon(Icons.arrow_forward_rounded),
                          )),
                    ]))
          ],
        ),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demoData = [
  OnBoard(
    image: onBoardingImg1,
    title: "Book rides for yourself and friends on the way",
    description:
        'Order from fellow classmates and students from your university to save money and get to college on time!',
  ),
  OnBoard(
    image: onBoardingImg2,
    title: "List your vehicle or carpool",
    description:
        'Order from fellow classmates and students from your university to save money and get to college on time!',
  ),
  OnBoard(
    image: onBoardingImg3,
    title: "Get Spot Plus",
    description:
        'Order from fellow classmates and students from your university to save money and get to college on time!',
  ),
  OnBoard(
    image: onBoardingImg1,
    title: "Deliver your package with drones",
    description:
        'Order from fellow classmates and students from your university to save money and get to college on time!',
  ),
  OnBoard(
    image: onBoardingImg2,
    title: "Order for yourself and friends on the way",
    description:
        'Order from fellow classmates and students from your university to save money and get to college on time!',
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                // Book rides for yourself and friends on the way
                Text(title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    )),
                const SizedBox(
                  height: 16.0,
                ),
                // Order from fellow classmates and students from your university to save money and get to college on time!
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      )
    ]);
  }
}
