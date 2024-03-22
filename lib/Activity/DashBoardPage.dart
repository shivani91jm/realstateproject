import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realstateproject/Activity/Home/HomePage.dart';
import 'package:realstateproject/Activity/Search/SearchPage.dart';
import 'package:realstateproject/Activity/Setting/ProfileSetingsPage.dart';
import 'package:realstateproject/MutipleProvidersss/BottomNavigationBarProvider.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Consumer<BottomNavigationBarProvider>(builder: (context,provider,child){
        return BottomNavigationBar(
          currentIndex: provider.selectedIndex,
          onTap: (index) => provider.selectedIndex = index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        );
      }),
      body: Consumer<BottomNavigationBarProvider>(builder: (context,provider,child){
        return IndexedStack(
          index: provider.selectedIndex,
          children: [
            HomePage(),
            SearcheringPage(),
            ProfileSettings(),
          ],
        );
      },),
    );
  }
}
