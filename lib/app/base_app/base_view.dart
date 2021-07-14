import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_weather_app/app/consts/app_colors.dart';
import 'package:lite_weather_app/ui/screens/today_page/today_page.dart';
import 'package:lite_weather_app/ui/screens/weekly_page/weekly_page.dart';

class BaseView extends StatefulWidget {
  final Widget? body;

  const BaseView({
    Key? key,
    this.body,
  }) : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    TodayPage(),
    WeeklyPage(),
    WeeklyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendarDay),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendarWeek),
            label: 'Weekly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          )
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
