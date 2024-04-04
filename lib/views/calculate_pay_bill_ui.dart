// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, sort_child_properties_last

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_share_project/views/show_pay_bill_ui.dart';

class CalculatePayBillUI extends StatefulWidget {
  const CalculatePayBillUI({super.key});

  @override
  State<CalculatePayBillUI> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUI> {
//CBcheck status
  bool? adultStatus = false;
  bool? teenStatus = false;
//CB and radio Ctrl
  TextEditingController adultCtrl = TextEditingController(text: '0');
  TextEditingController teenCtrl = TextEditingController(text: '0');
  TextEditingController cokeCtrl = TextEditingController(text: '0');
  TextEditingController plainCtrl = TextEditingController(text: '0');
//radio group
  bool _waterSelected = true;
//radio check status
  bool? StatusBvr = false;
  String _memberTypeSelected = 'ไม่เป็นสมาชิก';

  List<String> _memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิก Silver Member ลด 5%',
    'สมาชิก Gold Member ลด 10%',
    'สมาชิก Platinum Member ลด 20%',
  ];
  //รูปที่ถ่าย
  File? _imageFromCamera;

//Take Photo Method

  Future _getImageFromCamera() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
    );
    if (image == null) return;
    setState(() {
      _imageFromCamera = File(image.path);
    });
  }

  //สร้างเมธอดแสดง WarningMessage
  showWarningMessage(context, msg) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
          textAlign: TextAlign.center,
        ),
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'คิดเงิน',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      */
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.085,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    _getImageFromCamera();
                  },
                  child: Align(
                      alignment: Alignment.center,
                      child: _imageFromCamera == null
                          ? Image.asset(
                              'assets/images/camera.jpg',
                              width: MediaQuery.of(context).size.width * 0.35,
                            )
                          : Image.file(
                              _imageFromCamera!,
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.35,
                            )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'จำนวนคน',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
//CBadult
                Row(
                  children: [
                    Checkbox(
                      value: adultStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          if (paramValue == false) {
                            setState(() {
                              adultCtrl.text = '0';
                            });
                          }
                          adultStatus = paramValue;
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.deepOrange,
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน  ',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: adultCtrl,
                        enabled: adultStatus,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffix: Text(
                            'คน',
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ],
                ),
//CBteen
                Row(
                  children: [
                    Checkbox(
                      value: teenStatus,
                      onChanged: (paramValue) {
                        setState(() {
                          if (paramValue == false) {
                            setState(() {
                              teenCtrl.text = '0';
                            });
                          }
                          teenStatus = paramValue;
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.deepOrange,
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน  ',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: teenCtrl,
                        enabled: teenStatus,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"\d+([\.]\d+)?"))
                        ],
                        decoration: InputDecoration(
                          suffix: Text(
                            'คน',
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  'บุปเฟต์น้ำดื่ม',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
//Radio Beverage start
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: _waterSelected,
                      onChanged: (paramValue) {
                        setState(() {
                          _waterSelected = paramValue!;
                        });
                      },
                    ),
                    Text(
                      'รับ 25 บาท/หัว',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: _waterSelected,
                      onChanged: (paramValue) {
                        setState(() {
                          _waterSelected = paramValue!;
                        });
                      },
                    ),
//Radio Beverage end

                    Text(
                      'ไม่รับ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      '  โค้ก 20 บาท/ขวด จำนวน  ',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: cokeCtrl,
                        enabled: _waterSelected,
                        onChanged: (paramValue) {
                          if (paramValue == true) {
                            cokeCtrl.text = '0';
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffix: Text(
                            'ขวด',
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      '  น้ำเปล่า 15 บาท/ขวด จำนวน  ',
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: plainCtrl,
                        enabled: _waterSelected,
                        onChanged: (paramValue) {
                          if (paramValue == true) {
                            plainCtrl.text = '0';
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        decoration: InputDecoration(
                          suffix: Text(
                            'ขวด',
                          ),
                          counter: Offstage(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Text(
                  'ประเภทสมาชิก',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                DropdownButton(
                  value: _memberTypeSelected,
                  isExpanded: true,
                  onChanged: (paramValue) {
                    setState(() {
                      _memberTypeSelected = paramValue!;
                    });
                  },
                  items: _memberType
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.033,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_imageFromCamera == null) {
                            showWarningMessage(context, 'ถ่ายรูปด้วย');
                            return;
                          } else if (adultStatus == false &&
                              teenStatus == false) {
                            showWarningMessage(
                                context, 'เลือกผู้ใหญ่และหรือเด็กที่มากินด้วย');
                            return;
                          } else if (adultStatus == true &&
                                  adultCtrl.text == '0' ||
                              adultCtrl.text.trim().length == 0) {
                            showWarningMessage(
                                context, 'ตรวจสอบจำนวนผู้ใหญ่ด้วย');
                            return;
                          } else if (teenStatus == true &&
                                  teenCtrl.text == '0' ||
                              teenCtrl.text.trim().length == 0) {
                            showWarningMessage(context, 'ตรวจสอบจำนวนเด็กด้วย');
                            return;
                          }
                          //var for calculate
                          int adultNum = int.parse(adultCtrl.text);
                          int teenNum = int.parse(teenCtrl.text);
                          int cokeNum = int.parse(cokeCtrl.text);
                          int plainNum = int.parse(plainCtrl.text);

                          //calculate
                          double payBill = 0;

                          int waterBuffet = _waterSelected == true
                              ? (adultNum + teenNum) * 25
                              : 0;
                          payBill = (adultNum * 299) +
                              (teenNum * 69) +
                              waterBuffet +
                              (cokeNum * 20) +
                              (plainNum * 15);
                          //discount
                          if (_memberTypeSelected == "ไม่เป็นสมาชิก") {
                            payBill = payBill;
                          } else if (_memberTypeSelected ==
                              "สมาชิก Silver Member ลด 5%") {
                            payBill = payBill - (payBill * 5 / 100);
                          } else if (_memberTypeSelected ==
                              "สมาชิก Gold Member ลด 10%") {
                            payBill = payBill - (payBill * 10 / 100);
                          } else {
                            payBill = payBill - (payBill * 20 / 100);
                          }
                          ;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowPayBillUI(
                                        imageFromCamera: _imageFromCamera,
                                        adult: adultCtrl.text,
                                        teen: teenCtrl.text,
                                        waterSelected: _waterSelected == true
                                            ? 'รับ'
                                            : 'ไม่รับ',
                                        coke: cokeCtrl.text,
                                        plain: plainCtrl.text,
                                        memberType: _memberTypeSelected,
                                        payBill:
                                            payBill.toString(),
                                      )));
                        },
                        icon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวณเงิน',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _imageFromCamera = null;
                            adultStatus = false;
                            adultCtrl.text = '0';
                            teenStatus = false;
                            teenCtrl.text = '0';
                            _waterSelected = true;
                           cokeCtrl.text = '0';
                           plainCtrl.text = '0';
                           _memberTypeSelected = 'ไม่เป็นสมาชิก';

                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.moneyBill1Wave,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
