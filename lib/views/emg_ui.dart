import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/hotline.dart';
import 'package:url_launcher/url_launcher.dart';

class EmgUI extends StatefulWidget {
  const EmgUI({super.key});

  @override
  State<EmgUI> createState() => _EmgUIState();
}

class _EmgUIState extends State<EmgUI> {
  // ตัวแปรเก็บข้อมูลสายด่วน
  List hotlineData = [
    Hotline(
      name: 'เหตุด่วนเหตุร้าย',
      phone: '191',
      image: 'assets/images/emg_1.png',
    ),
    Hotline(
      name: 'แจ้งไฟไหม้สัตว์เข้าบ้าน',
      phone: '199',
      image: 'assets/images/emg_2.png',
    ),
    Hotline(
      name: 'สายด่วนรถหาย (ตำรวจแห่งชาติ)',
      phone: '1192',
      image: 'assets/images/emg_3.png',
    ),
    Hotline(
      name: 'อุบัติเหตุทางน้ำ',
      phone: '1196',
      image: 'assets/images/emg_4.png',
    ),
    Hotline(
      name: 'แจ้งคนหาย',
      phone: '1300',
      image: 'assets/images/emg_5.png',
    ),
    Hotline(
      name: 'ศูนย์ปลอดภัยคมนาคม',
      phone: '1356',
      image: 'assets/images/emg_6.png',
    ),
    Hotline(
      name: 'หน่วยแพทย์กู้ชีพ',
      phone: '1554',
      image: 'assets/images/emg_7.png',
    ),
    Hotline(
      name: 'ศูนย์เอราวัณ',
      phone: '1646',
      image: 'assets/images/emg_8.png',
    ),
    Hotline(
      name: 'เจ็บป่วยฉุกเฉิน',
      phone: '1669',
      image: 'assets/images/emg_9.png',
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
                  'อุบัติเหตุ-เหตุฉุกเฉิน',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/emg_0.png',
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
