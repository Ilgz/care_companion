import 'package:cash_manager/domain/intro/intro_item.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
class IntroPage extends StatefulWidget {
   IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
   int _currentPage = 0;
   final PageController pageController=PageController(initialPage: 0);

   late final List<Widget> _pages = List.generate(introItems.length, (index) => introBody(introItems[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      children: [
        Expanded(
          child: PageView( scrollDirection: Axis.horizontal,
            onPageChanged: (page){
              setState(() {
                _currentPage =page ;
              });
            },
            pageSnapping: true,controller:pageController,children:
              _pages
          ),
        ),
        _buildDotsIndicator(),
        SizedBox(height: 50,),
      ],
    ),),);
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
   Widget introBody(IntroItem introItem){
    return Column(children: [
      //Svg.asset("assets/images/${introItem.image}.svg")
    ],);
   }
}

// class IntroPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => SafeArea(
//     child: IntroductionScreen(
//       pages: [
//         PageViewModel(
//           title: 'A reader lives a thousand lives',
//           body: 'The man who never reads lives only one.',
//          // image: buildImage('assets/ebook.png'),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: 'Featured Books',
//           body: 'Available right at your fingerprints',
//           image: buildImage('assets/readingbook.png'),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: 'Simple UI',
//           body: 'For enhanced reading experience',
//           image: buildImage('assets/manthumbs.png'),
//           decoration: getPageDecoration(),
//         ),
//         PageViewModel(
//           title: 'Today a reader, tomorrow a leader',
//           body: 'Start your journey',
//           footer: ButtonWidget(
//             text: 'Start Reading',
//             onClicked: () => goToHome(context),
//           ),
//           image: buildImage('assets/learn.png'),
//           decoration: getPageDecoration(),
//         ),
//       ],
//       done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600)),
//       onDone: () => goToHome(context),
//       showSkipButton: true,
//       skip: Text('Skip'),
//       onSkip: () => goToHome(context),
//       next: Icon(Icons.arrow_forward),
//       dotsDecorator: getDotDecoration(),
//       onChange: (index) => print('Page $index selected'),
//       globalBackgroundColor: Theme.of(context).primaryColor,
//       nextFlex: 0,
//       // isProgressTap: false,
//       // isProgress: false,
//       // showNextButton: false,
//       // freeze: true,
//       // animationDuration: 1000,
//     ),
//   );
//
//   void goToHome(context) {
//
//     }
//
//   Widget buildImage(String path) =>
//       Center(child: Image.asset(path, width: 350));
//
//   DotsDecorator getDotDecoration() => DotsDecorator(
//     color: Color(0xFFBDBDBD),
//     //activeColor: Colors.orange,
//     size: Size(10, 10),
//     activeSize: Size(22, 10),
//     activeShape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(24),
//     ),
//   );
//
//   PageDecoration getPageDecoration() => PageDecoration(
//     titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//     bodyTextStyle: TextStyle(fontSize: 20),
//     imagePadding: EdgeInsets.all(24),
//     pageColor: Colors.white,
//   );
// }
// class ButtonWidget extends StatelessWidget {
//   final String text;
//   final VoidCallback onClicked;
//
//   const ButtonWidget({
//     required this.text,
//     required this.onClicked,
//   });
//
//   @override
//   Widget build(BuildContext context) =>
//       ElevatedButton(
//         onPressed: onClicked,
//         child: Text(
//           text,
//           style: TextStyle(color: Colors.white, fontSize: 16),
//         ),
//       );
// }