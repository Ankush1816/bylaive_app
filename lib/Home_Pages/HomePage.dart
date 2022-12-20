import 'package:bylaive/Home_Pages/FeedPage.dart';
import 'package:bylaive/Home_Pages/Home_others/Optoions.dart';
import 'package:bylaive/Home_Pages/ProfilePage.dart';
import 'package:bylaive/Home_Pages/SavedPage.dart';
import 'package:bylaive/Home_Pages/ShopPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Authentication/Userredirect.dart';
import 'package:get/get.dart';

class HomeAScreen extends StatefulWidget {
  const HomeAScreen({Key? key}) : super(key: key);

  @override
  State<HomeAScreen> createState() => _HomeAScreenState();
}

class _HomeAScreenState extends State<HomeAScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    ShopPage(),
    SavedPage(),
    Options(),
  ];
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Column(
    //     children: [
    //       ElevatedButton(
    //           onPressed: () {
    //             AuthService().signOut();
    //           },
    //           child: Text('Submit')),
    //     ],
    //   )
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFCAF3B),
        title: Text('Bylaive',style: GoogleFonts.robotoSlab(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
        actions: [
          IconButton(onPressed: (){Get.to(ProfilePage());}, icon: Icon(Icons.person))
        ],
      ),
      bottomNavigationBar: GNav(
        tabs: [
          GButton(
            icon: Icons.home_filled,
            text: 'Home',
          ),
          GButton(
            icon: Icons.shop,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.bookmark_add,
            text: 'Saved',
          ),
          GButton(
            icon: Icons.menu_rounded,
            text: 'Options',
          )
        ],
        backgroundColor: Color(0xFFF2DED8),
        padding: EdgeInsets.all(20),
        //activeColor:  Color(0xFFFCAF3B),

        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
