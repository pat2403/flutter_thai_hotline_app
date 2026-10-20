import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/hotline.dart';
import 'package:url_launcher/url_launcher.dart';

class TravleUI extends StatefulWidget {
  const TravleUI({super.key});

  @override
  State<TravleUI> createState() => _TravleUIState();
}

class _TravleUIState extends State<TravleUI> {
  // ตัวแปรเก็บข้อมูลสายด่วน
  List hotlineData = [
    Hotline(
      name: 'กรมทางหลวงชนบท',
      phone: '1146',
      image: 'assets/images/travel_1.png',
    ),
    Hotline(
      name: 'ตำรวจท่องเที่ยว',
      phone: '1155',
      image: 'assets/images/travel_2.png',
    ),
    Hotline(
      name: 'ตำรวจทางหลวง',
      phone: '1193',
      image: 'assets/images/travel_3.png',
    ),
    Hotline(
      name: 'ข้อมูลจราจร',
      phone: '1197',
      image: 'assets/images/travel_4.png',
    ),
    Hotline(
      name: 'ขสมก.',
      phone: '1348',
      image: 'assets/images/travel_5.png',
    ),
    Hotline(
      name: 'บขส.',
      phone: '1490',
      image: 'assets/images/travel_6.png',
    ),
    Hotline(
      name: 'เส้นทางบนทางด่วน',
      phone: '1543',
      image: 'assets/images/travel_7.png',
    ),
    Hotline(
      name: 'กรมทางหลวง',
      phone: '1586',
      image: 'assets/images/travel_8.png',
    ),
    Hotline(
      name: 'การรถไฟแห่งประเทศไทย',
      phone: '1690',
      image: 'assets/images/travel_9.png',
    ),
  ];
  // Method โทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
    if (!await launchUrl(launchUri)) {
      throw 'Could not launch $launchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 8,
            right: 8,
          ),
          child: Center(
            child: Column(
              children: [
                Text('สายด่วน',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  'การเดินทาง',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/travel_0.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(12.0),
                    itemCount: hotlineData.length,
                    itemBuilder: (context, index) {
                      final item = hotlineData[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          leading: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Image.asset(
                              hotlineData[index].image,
                            ),
                          ),
                          title: Text(
                            hotlineData[index].name,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            hotlineData[index].phone,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              _makePhoneCall(hotlineData[index].phone);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
