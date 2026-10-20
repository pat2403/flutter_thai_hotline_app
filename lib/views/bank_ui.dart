// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/models/hotline.dart';
import 'package:url_launcher/url_launcher.dart';

class BankUI extends StatefulWidget {
  const BankUI({super.key});

  @override
  State<BankUI> createState() => _BankUIState();
}

class _BankUIState extends State<BankUI> {
  // ตัวแปรเก็บข้อมูลสายด่วน
  List hotlineData = [
    Hotline(
      name: 'ธนาคารกรุงเทพ',
      phone: '1333',
      image: 'assets/images/bank_1.png',
    ),
    Hotline(
      name: 'ธนาคารออมสิน',
      phone: '1115',
      image: 'assets/images/bank_2.png',
    ),
    Hotline(
      name: 'ธนาคารกสิกรไทย',
      phone: '02-888-8888',
      image: 'assets/images/bank_3.png',
    ),
    Hotline(
      name: 'ธนาคารกรุงไทย',
      phone: '02-111-1111',
      image: 'assets/images/bank_4.png',
    ),
    Hotline(
      name: 'ธนาคารกรุงศรี',
      phone: '1572',
      image: 'assets/images/bank_5.png',
    ),
    Hotline(
      name: 'ธนาคารทีเอ็มบีธนชาต',
      phone: '1428',
      image: 'assets/images/bank_6.png',
    ),
    Hotline(
      name: 'citybank',
      phone: '1588',
      image: 'assets/images/bank_7.png',
    ),
    Hotline(
      name: 'LH BANK',
      phone: '1327',
      image: 'assets/images/bank_8.png',
    ),
    Hotline(
      name: 'ธอส.',
      phone: '02-645-9000',
      image: 'assets/images/bank_9.png',
    ),
    Hotline(
      name: 'ธนาคารไทยพาณิชย์',
      phone: '02-777-7777',
      image: 'assets/images/bank_10.png',
    ),
    Hotline(
      name: 'ธนาคารเกียรตินาคิน',
      phone: '02-165-5555',
      image: 'assets/images/bank_11.png',
    ),
    Hotline(
      name: 'ธนาคารไทยเครดิต',
      phone: '02-697-5454',
      image: 'assets/images/bank_12.png',
    ),
    Hotline(
      name: 'UOB',
      phone: '02-285-1555',
      image: 'assets/images/bank_13.png',
    ),
    Hotline(
      name: 'TISCO',
      phone: '02-633-6000',
      image: 'assets/images/bank_14.png',
    ),
    Hotline(
      name: 'ธนาคารอิสลาม',
      phone: '02-204-2766',
      image: 'assets/images/bank_15.png',
    ),
    Hotline(
      name: 'ธนาคารซีไอเอ็มบี ไทย',
      phone: '02-626-7777',
      image: 'assets/images/bank_16.png',
    ),
  ];
  // Method โทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final String cleanNumber = phoneNumber.replaceAll(RegExp(r'\s-'), '');
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
                  'ธนาคาร',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'assets/images/bank_0.png',
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
