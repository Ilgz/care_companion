import 'package:cash_manager/application/intro/intro_cubit.dart';
import 'package:cash_manager/domain/intro/intro_item.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/core/router.dart';
import 'package:cash_manager/presentation/core/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _currentPage = 0;
  final PageController pageController = PageController(initialPage: 0);
  late final List<Widget> _pages =
      List.generate(introItems.length, (index) => introBody(introItems[index]));

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroCubit, IntroState>(
      listener: (context, state) {
        if (!state.isFirstTime) {
          goToArticleOverviewPage(context);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    pageSnapping: true,
                    controller: pageController,
                    children: _pages),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                    onPressed: () {
                      pageController.animateToPage(_pages.length - 1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )),
                  Expanded(child: _buildDotsIndicator()),
                  Expanded(
                      child: TextButton(
                    onPressed: () {
                      if (_currentPage == _pages.length - 1) {
                        context.read<IntroCubit>().setFirstTime(false);
                      } else {
                        pageController.animateToPage(_currentPage + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Text(
                      _currentPage == _pages.length - 1 ? "Finish" : "Next",
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDotsIndicator() {
    List<Widget> dots = [];

    for (int i = 0; i < _pages.length; i++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 8.0,
            height: 8.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == i ? Color(0xfffd894f) : Colors.grey,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }

  Widget introBody(IntroItem introItem) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: SvgPicture.asset(
              "assets/images/intro_${introItem.image}.svg",
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                introItem.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                introItem.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
