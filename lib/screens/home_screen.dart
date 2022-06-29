import 'package:ebook_flutter_app/screens/Setting.dart';
import 'package:ebook_flutter_app/screens/search_screen.dart';
import 'package:ebook_flutter_app/screens/start_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = [
    Wrap(
      direction: Axis.horizontal,
      spacing: 10.0,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 10.0),
          height: 150.0,
          width: 150.0,
          child: Text(
              'حداقل نیاز های برنامه  آموزشی  رشته پزشکی  مقطع دکتری  عمومی',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 6.0),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 10.0),
          height: 150.0,
          width: 150.0,
          child: Text('برنامه آموزشی رشته پزشکی  مقطع دکتری عمومی',
              textAlign: TextAlign.center, textDirection: TextDirection.rtl),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 6.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          alignment: Alignment.center,
          height: 150.0,
          width: 150.0,
          child: Text('ارزشیابی برنامه آموزشی رشته پزشکی مقطع دکتری عمومی ',
              textAlign: TextAlign.center, textDirection: TextDirection.rtl),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 6.0),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          alignment: Alignment.center,
          height: 150.0,
          width: 150.0,
          child: Text(
              'مشخصات دوره ودروس  برنامه آموزشی  رشته پزشکی  مقطع دکتری عمومی',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo, width: 6.0),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
        ),
      ],
    ),
    SearchScreen(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name_app_bar(_selectedIndex)),
          centerTitle: true,
        ),
        body: Center(
          child: _pages.elementAt(_selectedIndex), //New
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex, //New
          showUnselectedLabels: false,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String name_app_bar(int index){
    switch (index) {
      case 0:
      return 'صفحه اصلی';

      case 1:
      return 'جست وجو';

      default:
      return 'تنظیمات';
    }
  }


}
