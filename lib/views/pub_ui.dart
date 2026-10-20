import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/hotline.dart';
import 'package:url_launcher/url_launcher.dart';

class PubUI extends StatefulWidget {
  const PubUI({super.key});

  @override
  State<PubUI> createState() => _PubUIState();
}

class _PubUIState extends State<PubUI> {
  // ตัวแปรเก็บข้อมูลสายด่วน
  List hotlineData = [
    Hotline(
      name: 'ไฟฟ้านครหลวง',
      phone: '1130',
      image: 'assets/images/pub_1.png',
    ),
    Hotline(
      name: 'ไฟฟ้าส่วนภูมิภาค',
      phone: '1129',
      image: 'assets/images/pub_2.png',
    ),
    Hotline(
      name: 'ไฟฟ้าฝ่ายผลิต',
      phone: '1416',
      image: 'assets/images/pub_3.png',
    ),
    Hotline(
      name: 'การประปานครหลวง',
      phone: '1125',
      image: 'assets/images/pub_4.png',
    ),
    Hotline(
      name: 'การประปาส่วนภูมิภาค',
      phone: '1662',
      image: 'assets/images/pub_5.png',
    ),
    Hotline(
      name: 'TRUE',
      phone: '1242',
      image: 'assets/images/pub_6.png',
    ),
    Hotline(
      name: 'DTAC',
      phone: '1678',
      image: 'assets/images/pub_7.png',
    ),
    Hotline(
      name: 'AIS',
      phone: '1175',
      image: 'assets/images/pub_8.png',
    ),
    Hotline(
      name: 'TOT',
      phone: '1100',
      image: 'assets/images/pub_9.png',
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
                  'สาธารณูปโภค',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/pub_0.png',
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
