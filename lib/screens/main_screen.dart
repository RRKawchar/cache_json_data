import 'package:cache_json_data/screens/json_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex=0;
  void ontap(int page){
    setState(() {
      _currentIndex=page;
    });
  }
  List<Widget> pages=[
   const JsonPage(),
    const Text("Page Two"),
    const Text("Settings")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedFontSize: 12,
        unselectedItemColor: Colors.black12,
        onTap: ontap,
        currentIndex:_currentIndex,
        items: const[
          BottomNavigationBarItem(
              icon:Icon(Icons.newspaper),
            label: "News"
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.contact_mail),
              label: "Contact"
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.settings_outlined),
              label: "Settings"
          ),
        ],
      ),
    );
  }


}
