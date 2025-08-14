import 'package:assignment/utils/app_color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appLightColor,
      body: Column(
        children: [
          Expanded(child: buildPageView()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildLeftButton(),
                Spacer(),
                buildSmoothIndicator(),
                Spacer(),
                buildRightButton(),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        currentPage = value;
        setState(() {});
      },
      children: [
        Image.asset("assets/images/Onboarding Light.png", fit: BoxFit.fill),
        Image.asset("assets/images/Onboarding Light 1.png", fit: BoxFit.fill),
        Image.asset("assets/images/Onboarding Light (2).png", fit: BoxFit.fill),
      ],
    );
  }

  buildLeftButton() {
    return currentPage == 0
        ? SizedBox(width: 37, height: 37)
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(37, 37),
              backgroundColor: AppColor.appLightColor,
              shape: CircleBorder(side: BorderSide(color: AppColor.purple)),
            ),
            onPressed: () {
              pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
              setState(() {});
            },
            child: Icon(Icons.arrow_back, color: AppColor.purple, weight: 30),
          );
  }

  buildRightButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(37, 37),
        backgroundColor: AppColor.appLightColor,
        shape: CircleBorder(side: BorderSide(color: AppColor.purple)),
      ),
      onPressed: () {
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
        setState(() {});
      },
      child: Icon(Icons.arrow_forward, color: AppColor.purple, weight: 30),
    );
  }

  buildSmoothIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: currentPage,

      count: 3,
      effect: ExpandingDotsEffect(dotWidth: 10, dotHeight: 10),
    );
  }
}


