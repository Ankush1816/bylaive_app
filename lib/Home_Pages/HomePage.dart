import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Home_Pages/FeedPage.dart';
import 'package:bylaive/Home_Pages/Home_others/Optoions.dart';
import 'package:bylaive/Livestream/LiveStream.dart';
import 'package:bylaive/Profile/ProfilePage.dart';
import 'package:bylaive/Home_Pages/SavedPage.dart';
import 'package:bylaive/Home_Pages/CatagoryPage.dart';
import 'package:bylaive/Seller/Becomeseller.dart';
import 'package:bylaive/Test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../Authentication/Userredirect.dart';
import 'package:get/get.dart';

import '../Cart/CartScreen.dart';
import '../Services/Fire_services.dart';

class HomeAScreen extends StatefulWidget {
  const HomeAScreen({Key? key}) : super(key: key);

  @override
  State<HomeAScreen> createState() => _HomeAScreenState();
}

class _HomeAScreenState extends State<HomeAScreen> {
  String? email = FirebaseAuth.instance.currentUser?.email;
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    LiveStream(),
    SavedPage(),
    ProfilePage(),
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
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Bylaive',
            style: GoogleFonts.robotoSlab(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        actions: [
          Stack(
            children: [
              Icon(Icons.circle,color: primary,size: 12,),
              IconButton(
                onPressed: () {
                  Get.to(CartScreen());
                },
                icon: Icon(Icons.shopping_cart),color: Colors.black,),

            ],
          )
        ],
      ),
      drawer: StreamBuilder(
          stream: FirestoreServices.getUser(email!),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              return Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: secondary,
                      ), //BoxDecoration
                      child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: secondary),
                        accountName: Text(
                          "${data['name']}",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        accountEmail: Text(
                          "${data['email']}",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        currentAccountPictureSize: Size.square(50),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: primary,
                          child: Text(
                            "A",
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ), //Text
                        ), //circleAvatar
                      ), //UserAccountDrawerHeader
                    ), //DrawerHeader
                    ListTile(
                      leading: const Icon(Icons.sell),
                      title: const Text(' Top Sellers '),
                      onTap: () {
                        Get.to(ProfilePage());
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.update),
                      title: const Text(' My orders '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.live_tv),
                      title: const Text(' Go Live '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.add_shopping_cart_outlined),
                      title: const Text(' Saved Products '),
                      onTap: () {
                        //   Get.to(BottomNavBar());
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_pin_outlined),
                      title: const Text('Become seller'),
                      onTap: () {
                        Get.to(BecomeSeller());
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('LogOut'),
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                child: Text('Not an verified user'),
              );
            }
          }),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 55.0,
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.shop, size: 30),
          Icon(Icons.bookmark, size: 30),
          Icon(Icons.person, size: 30),
       //   Icon(Icons.perm_identity, size: 30),
        ],
        color: primary,
        buttonBackgroundColor: secondary,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      // bottomNavigationBar: GNav(
      //   tabs: [
      //     GButton(
      //       icon: Icons.home_filled,
      //       text: 'Home',
      //     ),
      //     GButton(
      //       icon: Icons.shop,
      //       text: 'LiveShop',
      //     ),
      //     GButton(
      //       icon: Icons.thumb_up_sharp,
      //       text: 'Liked',
      //     ),
      //     GButton(
      //       icon: Icons.person,
      //       text: 'Profile',
      //     )
      //   ],
      //   backgroundColor: Colors.white,
      //   padding: EdgeInsets.all(20),
      //   activeColor:  Color(0xFFFCAF3B),
      //
      //   selectedIndex: _selectedIndex,
      //   onTabChange: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_page),
      ),
    );
  }
}
