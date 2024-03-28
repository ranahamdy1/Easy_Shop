import 'package:easy_shop/features/bottom_nav_bar/profile/profile_screen.dart';
import 'package:easy_shop/public/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart/cart_screen.dart';
import 'favourite/favourite_view.dart';
import 'home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Widget> body =  [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Center(
          child: body[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken, color: Colors.black,),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag,color: Colors.black,),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.black,),
              label: 'Home'
          ),
        ],
      ),
    );
  }
}
