import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/favourite_screen/favourite.dart';
import 'package:login_screen_homework/ui/home/home_screen.dart';
import 'package:login_screen_homework/ui/profile_screen/profile.dart';
import 'package:login_screen_homework/ui/shopping_screen/shopping.dart';

class TabsBox extends StatefulWidget {
  const TabsBox({Key? key}) : super(key: key);

  @override
  State<TabsBox> createState() => _TabsBoxState();

}

class _TabsBoxState extends State<TabsBox> {
  int _currentIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(Home());
    screens.add(Shopping());
    screens.add(Favourite());
    screens.add(Profile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.yellow,
          currentIndex: _currentIndex,
          onTap: ( index) {
            setState(() {
              _currentIndex = index;
            });
          },

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.white,size: 30),label:""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.white,size: 30,),label:""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite,color: Colors.white,size: 30,),label:""),
            BottomNavigationBarItem(icon: Icon(Icons.person_2,color: Colors.white,size: 30,),label:""),
          ],
        ),
      ),
    );
  }
}
