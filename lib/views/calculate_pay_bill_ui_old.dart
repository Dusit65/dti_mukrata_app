// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatePayBillUIold extends StatefulWidget {
  const CalculatePayBillUIold({super.key});

  @override
  State<CalculatePayBillUIold> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUIold> {
//CBcheck status
  bool? StatusAdult = false;
  bool? StatusKid = false;
//CB and radio Ctrl
  TextEditingController abultCtrl = TextEditingController(text: '');
  TextEditingController childrenCtrl = TextEditingController(text: '');
  TextEditingController BeverageCtrl = TextEditingController(text: '');
//radio var
  String food = 'Beverage';
//radio check status
  bool? StatusBvr = false;
//dropdown var
  List<String> _memList = [
    'มีสมาชิก',
    'ไม่มีสมาชิก',
  ];
  String _member = 'ไม่มีสมาชิก';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusScopeNode());
        },
        child: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/camera.jpg',
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                //amount of customer
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 275),
                  child: Text(
                    'จำนวนคน',
                    style: GoogleFonts.kanit(
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                //checkbox start
                //CBAdult
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 115.0),
                  child: Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            if (value == false) {
                              setState(() {
                                abultCtrl.text = '';
                              });
                            }
                            StatusAdult = value;
                          });
                        },
                        value: StatusAdult,
                        checkColor: Colors.white,
                        activeColor: Colors.deepOrange,
                        side: BorderSide(color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.005,
                      ),
                      Text(
                        'ผู้ใหญ่ 299/คน จำนวน',
                        style: GoogleFonts.kanit(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Flexible(
                        child: TextField(
                          controller: abultCtrl,
                          enabled: StatusAdult,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"\d+([\.]\d+)?"))
                          ],
                          decoration: InputDecoration(
                            hintText: '    0 คน',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                //CBchildren
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35.0, right: 130.0, top: 10),
                  child: Row(
                    children: [
                      Checkbox(
                        onChanged: (value) {
                          setState(() {
                            if (value == false) {
                              setState(() {
                                childrenCtrl.text = '';
                              });
                            }
                            StatusKid = value;
                          });
                        },
                        value: StatusKid,
                        checkColor: Colors.white,
                        activeColor: Colors.deepOrange,
                        side: BorderSide(color: Colors.black),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.005,
                      ),
                      Text(
                        'เด็ก 69/คน จำนวน',
                        style: GoogleFonts.kanit(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Flexible(
                        child: TextField(
                          controller: abultCtrl,
                          enabled: StatusKid,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"\d+([\.]\d+)?"))
                          ],
                          decoration: InputDecoration(
                            hintText: '    0 คน',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * 0.06,
                // ),
                //checkbox end
                //Buffet Beverage start
                //Buffet with beverage
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 275, top: 20),
                  child: Text(
                    'บุฟเฟ่ต์น้ำดื่ม',
                    style: GoogleFonts.kanit(
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //RBeverage
                      Row(
                        children: [
                          Radio(
                            onChanged: (paraValue) {
                              setState(() {
                                food = paraValue!;
                              });
                            },
                            value: 'Beverage',
                            groupValue: food,
                          ),
                          Text(
                            'รับ 25 บาท/หัว',
                            style: GoogleFonts.kanit(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      //RNo Beverage
                      Row(
                        children: [
                          Radio(
                            onChanged: (paraValue) {
                              setState(() {
                                food = paraValue!;
                              });
                            },
                            value: 'No',
                            groupValue: food,
                          ),
                          Text(
                            'ไม่รับ',
                            style: GoogleFonts.kanit(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.018,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                //Amount of coke
                Padding(
                  padding: const EdgeInsets.only(left: 54.0, right: 125.0),
                  child: Row(
                    children: [
                      Text(
                        'โค้ก 20 บาท/ขวด จำนวน',
                        style: GoogleFonts.kanit(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Flexible(
                        child: TextField(
                          controller: BeverageCtrl,
                          enabled: food == 'No' ? true : false,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"\d+([\.]\d+)?"))
                          ],
                          decoration: InputDecoration(
                            hintText: '    0 ขวด',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                //Amount of pure water
                Padding(
                  padding: const EdgeInsets.only(left: 54.0, right: 105.0),
                  child: Row(
                    children: [
                      Text(
                        'น้ำเปล่า 15 บาท/ขวด จำนวน',
                        style: GoogleFonts.kanit(
                          fontSize: MediaQuery.of(context).size.height * 0.018,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Flexible(
                        child: TextField(
                          controller: BeverageCtrl,
                          enabled: food == 'No' ? true : false,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"\d+([\.]\d+)?"))
                          ],
                          decoration: InputDecoration(
                            hintText: '    0 ขวด',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Member type start
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 265, top: 20),
                  child: Text(
                    'ประเภทสมาชิก',
                    style: GoogleFonts.kanit(
                      fontSize: MediaQuery.of(context).size.height * 0.023,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.006,
                ),
                //Member dropdown
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _member,
                      onChanged: (paraValue) {
                        setState(() {
                          _member = paraValue!;
                        });
                      },
                      items: _memList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      e,
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                //Member type end
                //button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.white,
                        ),
                        label: Text(
                          "คำนวณเงิน",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.5,
                              MediaQuery.of(context).size.height * 0.055,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.032,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.white,
                        ),
                        label: Text(
                          "ยกเลิก",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[850],
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.3,
                              MediaQuery.of(context).size.height * 0.055,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
