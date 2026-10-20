import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';
import 'package:flutter_thai_hotline_app/views/bank_ui.dart';
import 'package:flutter_thai_hotline_app/views/emg_ui.dart';
import 'package:flutter_thai_hotline_app/views/pub_ui.dart';
import 'package:flutter_thai_hotline_app/views/travel.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  List subhome = [
    TravleUI(),
    EmgUI(),
    BankUI(),
    PubUI(),
  ];

  // สร้างตัวแปรเก็บ index ของหน้า
  int? selectedIndex = 0; // 0 คือหน้าแรก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วน AppBar
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.height * 0.024,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUI(),
                ),
              );
            },
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
      ),
      // ส่วนของ BottomNavigationBar()
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // ให้แสดง 4 หน้า
        onTap: (paramValue) {
          // โค้ดที่มีผลต่อการแสดงผลต้องเขียนเป็น setState()
          setState(() {
            selectedIndex = paramValue;
          });
        },
        currentIndex: selectedIndex!,
        selectedItemColor: Colors.red[900],
        items: [
          BottomNavigationBarItem(
            icon: AnimatedScale(
              scale: selectedIndex == 0 ? 1.3 : 1,
              duration: Duration(milliseconds: 200),
              child: Icon(
                Icons.directions_bus,
              ),
            ),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: AnimatedScale(
              scale: selectedIndex == 1 ? 1.3 : 1,
              duration: Duration(milliseconds: 200),
              child: Icon(
                Icons.emergency_sharp,
              ),
            ),
            label: 'อุบัติเหตุ-เหตุฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: AnimatedScale(
              scale: selectedIndex == 2 ? 1.3 : 1,
              duration: Duration(milliseconds: 200),
              child: Icon(
                Icons.account_balance_outlined,
              ),
            ),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: AnimatedScale(
              scale: selectedIndex == 3 ? 1.3 : 1,
              duration: Duration(milliseconds: 200),
              child: Icon(
                Icons.public,
              ),
            ),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
      // ส่วนของ body
      body: subhome[selectedIndex!],
    );
  }
}
