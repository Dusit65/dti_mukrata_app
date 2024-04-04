// ignore_for_file: unused_field

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_share_project/views/about_ui.dart';
import 'package:money_share_project/views/calculate_pay_bill_ui.dart';

import 'package:money_share_project/views/menu_shop_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
//variable Views
  List<Widget> _showView = [
    CalculatePayBillUI(),
    MenuShopUI(),
    AboutUI(),
  ];

//create variable collect index number
  int _currentIndex = 1;
  final _Notchcontroller = NotchBottomBarController(index:1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
//start body
      body: _showView[_currentIndex],
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _Notchcontroller,
        notchColor: Colors.deepOrange,
        color: Colors.deepOrange,
        kIconSize: 24,
        kBottomRadius: 20,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.grey,
            ),
            itemLabel: 'คิดเงิน',
            activeItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.white,
            ),
          ),
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.grey,
            ),
            itemLabel: 'Home',
            activeItem: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          BottomBarItem(
            inActiveItem: Icon(
              FontAwesomeIcons.moneyBill1Wave,
              color: Colors.grey,
            ),
            itemLabel: 'เกี่ยวกับ',
            activeItem: Icon(
              Icons.star,
              color: Colors.white,
            ),
          ),
        ],
      ),
//end body
    );
  }
}
