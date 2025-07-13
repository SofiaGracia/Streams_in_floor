import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarApp extends StatefulWidget {
  final Widget searchScreen;
  final Widget asyncScreen;
  final Widget streamScreen;

  const NavigationBarApp(
      {super.key,
      required this.searchScreen,
      required this.asyncScreen,
      required this.streamScreen});

  @override
  State<NavigationBarApp> createState() => _NavigationBarAppState();
}

class _NavigationBarAppState extends State<NavigationBarApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      widget.searchScreen,
      widget.asyncScreen,
      widget.streamScreen
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.list),
            icon: Icon(Icons.list_outlined),
            label: 'ListFuture',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.list),
            icon: Icon(Icons.list_outlined),
            label: 'ListStream',
          ),
        ],
      ),
    );
  }
}
