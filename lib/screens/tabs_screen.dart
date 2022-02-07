import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './home_screen.dart';
import './activities_and_events_screen.dart';
import './donation_and_volunteer_screen.dart';
import './about_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screenOptions = [
    HomeScreen(),
    ActivitiesAndEventsScreen(),
    DonationAndVolunteerScreen(),
    AboutScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Theme(
        data: ThemeData(primarySwatch: Colors.grey),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_activity), label: 'Events'),
            BottomNavigationBarItem(
                icon: Icon(Icons.volunteer_activism), label: 'Help'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'About'),
          ],
          currentIndex: _selectedIndex,
          selectedIconTheme:
              IconThemeData(color: Theme.of(context).primaryColorLight),
          selectedLabelStyle: GoogleFonts.notoSans(fontSize: 12),
          unselectedLabelStyle: GoogleFonts.notoSans(fontSize: 12),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
