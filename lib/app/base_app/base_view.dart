import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_weather_app/core/services/connectivity/network_connectivity.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:lite_weather_app/ui/screens/share_page/share_page.dart';
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
    SharePage(),
  ];

  dynamic renderAppBar(bool value) {
    if (value)
      return PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'No internet connection',
            style: TextStyle(fontSize: 8.sp),
          ),
          centerTitle: true,
        ),
      );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<NetworkConnectivity>(context);
    return Scaffold(
      appBar: renderAppBar(provider.status == ConnectivityResult.none),
      bottomNavigationBar: BottomNavigationBar(
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
