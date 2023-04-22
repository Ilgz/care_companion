import 'package:cash_manager/presentation/article/article_overview_page.dart';
import 'package:cash_manager/presentation/core/constants.dart';
import 'package:cash_manager/presentation/milestone/milestone_overview_page.dart';
import 'package:cash_manager/presentation/tracker/tracker_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int get currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location == (t.initialLocation));
    return index < 0 ? 0 : index;
  }

  //callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  final List<Widget> _mainContents = [
    const ArticleOverviewPage(),
    const MilestoneOverviewPage(),
    TrackerPage()
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (MediaQuery.of(context).size.width > 640) ...[
                NavigationRail(
                  backgroundColor: Colors.white,
                  minWidth: 55.0,
                  selectedIndex: currentIndex,
                  onDestinationSelected: (index) =>
                      _onItemTapped(context, index),
                  labelType: NavigationRailLabelType.all,
                  leading: Column(
                    children: const [
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                  selectedIconTheme: const IconThemeData(color: Color(0xfffd894f)) ,
                  selectedLabelTextStyle: const TextStyle(color: Color(0xfffd894f)),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.description_outlined),
                      label: Text("Articles"),
                    ),
                    NavigationRailDestination(
                        icon: Icon(Icons.flag_outlined),
                        label: Text("Milestones")),
                    NavigationRailDestination(
                        icon: Icon(Icons.bar_chart),
                        label: Text("Growth")),
                  ],
                )
              ],
              Expanded(
                child: IndexedStack(
                  index: currentIndex,
                  children: _mainContents,
                ),
              )
              //Expanded(child: _mainContents[currentIndex])
            ],
          ),
          bottomNavigationBar: MediaQuery.of(context).size.width < 640
              ? BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
                  unselectedItemColor:Colors.grey[400] ,
                  currentIndex: currentIndex,
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                  unselectedIconTheme: IconThemeData(size: 20),
                  selectedIconTheme: IconThemeData(size: 20),
                  selectedLabelStyle: TextStyle(fontSize: 12),
                  selectedItemColor: Color(0xfffd894f),
                  items: tabs,
                  onTap: (index) => _onItemTapped(context, index),
                )
              : null),
    );
  }
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;
}

const tabs = [
  ScaffoldWithNavBarTabItem(
    initialLocation: PageRoutes.articleOverviewPage,
    icon: Icon(Icons.description_outlined),
    label: 'Articles',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: PageRoutes.milestoneOverviewPage,
    icon: Icon(Icons.flag_outlined),
    label: 'Milestones',
  ),
  ScaffoldWithNavBarTabItem(
    initialLocation: PageRoutes.trackerPage,
    icon: Icon(Icons.bar_chart),
    label: 'Growth',
  ),
];
