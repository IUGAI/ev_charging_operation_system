import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ev_charging_operation_system/components/CardRegister/Buisness/DetailAdress.dart';
import 'package:ev_charging_operation_system/components/CardRegister/GovernmentCard/Govermentcardset.dart';
import 'package:ev_charging_operation_system/components/CardRegister/TextFiekd_CardExpireDate_Block.dart';
import 'package:ev_charging_operation_system/components/SignUp/Sign_up_title.dart';
import 'package:ev_charging_operation_system/networking/networking.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:provider/provider.dart';
import '../model/UseMultiProvider.dart';
import '../postalKorea/remedi_kopo.dart';
import '../postalKorea/src/kopo_model.dart';
import 'package:flutter/cupertino.dart';
import 'AlertWidget.dart';
import 'CardRegister/Buisness/BtnandTextfield.dart';
import 'CardRegister/BuisnessCard/Address_text_field.dart';
import 'CardRegister/BuisnessCard/Widget_Choose_CardRegister.dart';
import 'Login//Login_btn_block/LoginBtn.dart';
import 'Login/Login_btn_block//SignInBtn.dart';
import 'SignUp/Text_Field_Auto.dart';
import 'SignUp/Widget_Choose.dart';
import 'SignUp/Widget_of_Name.dart';
import 'SignUp/Title_Widget_Block.dart';
import 'SignUp/Text_Field_Widget.dart';
import 'CardRegister/Title_field_Sc_Block.dart';
import 'CardRegister/Title_field.dart';
import 'CardRegister/TextField_CardPassword_Block.dart';
import 'CardRegister/TextField_Card_Bank.dart';
import 'CardRegister/Register_Button_Block/Register_User_Button.dart';
import 'CardRegister/TextFied_Card.dart';
import 'CardRegister/Register_Button_Block/FindBlock.dart';


String chargecardcompnay = '98';
class CardRegisterBlock extends StatefulWidget {
  const CardRegisterBlock({Key? key}) : super(key: key);

  @override
  State<CardRegisterBlock> createState() => _CardRegisterBlockState();
}

String addresss = '';
String postalcode = '';

class _CardRegisterBlockState extends State<CardRegisterBlock> {
  List<RadioOption> options = [
    RadioOption(value: '1', label: '교통카드'),

  ];
  List<RadioOption> optionsbank = [
    RadioOption(value: '1', label: '개인카드'),
    RadioOption(value: '2', label: '법인카드'),
  ];
  final transportcard = TextEditingController();
  final debitcard = TextEditingController();
  final month = TextEditingController();
  final year = TextEditingController();
  final password = TextEditingController();
  final address = TextEditingController();
  final detailadress = TextEditingController();
  String selectedOption = '1';
  String selectedoptionbank = '1';

  final nextcard1 = TextEditingController();
  final nextcard2 = TextEditingController();
  final nextcard3 = TextEditingController();
  final postalcodecontollerss = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transportcard.text = '12';
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    final stringprovider = Provider.of<DataMulti>(context);
    String passwordController = stringprovider.password;
    String passwordControllerchecked = stringprovider.check_password;
    String id = stringprovider.id;
    String name = stringprovider.verificationname;
    String phone = stringprovider.verificationmobileno;
    String bithday = stringprovider.verificationidcard.substring(2);
    String gender = stringprovider.verificationgender;
    String car = stringprovider.carNumber;
    String carname = stringprovider.carName;
    String cardtype = stringprovider.cardtype;
    chargecardcompnay = stringprovider.chargecardcompnay;
    String chargeCardNumber = stringprovider.chargeCardNumber;

    String bank_card_number = stringprovider.creditCardNumberregist;
    String bank_card_month = stringprovider.creditCardExpireMonthregist;
    String bank_card_year = stringprovider.creditCardExpireYearregist;
    String bank_card_password = stringprovider.creditCardpasswordregist;

    return Container(
        child: ListView(
      children: [
        SizedBox(height: 30.0),
        SIgn_up_title(),
        SizedBox(height: 20.0),
        Title_field(),
        SizedBox(
          height: 10.0,
        ),
        Title_field_Sc(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: options
              .map((option) => Expanded(
                    child: RadioListTile(
                      title: Text(
                        option.label,
                        style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ?  23: 15),
                      ),
                      value: option.value[0],
                      groupValue: selectedOption,
                      onChanged: (value) {
                        // Update the selected option when the user selects a radio button
                        setState(() {
                          selectedOption = value!;
                          stringprovider.getcardtype(value);
                          print(selectedOption);
                          print('data : ${stringprovider.id}');
                        });
                      },
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 20),
        selectedOption == '1'
            ? Column(children: [
                TitleWidget(
                  title: '충전카드 발급기관',
                  style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText,
                ),
                SizedBox(height: 10),
                Widgetofname(title: '선택', function: (value){
                  stringprovider.getchargecardcompnay(value.toString());
                },),
                SizedBox(height: 30),
                TitleWidget(title: '교통카드번호', style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText),
                SizedBox(height: 10),
                TextFieldWidget_Card(
                    passwordController: transportcard,
                    hintextl: '16자리',
                    isPassword: false),
              ])
            : Column(children: [
                TitleWidget(title: '회원카드', style:screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText),
                SizedBox(height: 10),
                Wudget_choose_Card_Register(title: '선택'),
                SizedBox(
                  height: 20,
                ),
                TitleWidget(title: '주소', style: screenWidth > 900 || screenWidth > 600 ? loginText_l :  loginText),
                SizedBox(

                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Btnandtext(
                        function: () async {
                          KopoModel model = await Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Remedicopo(),
                            ),
                          );
                          setState(() {
                            postalcodecontollerss.text = '${model.zonecode}';
                            address.text = '${model.address}';
                            stringprovider.setpostalcode('${model.zonecode}');
                            stringprovider.setadrress('${model.address}');
                          });
                        },
                        hintextl: '',
                        isPassword: false, postalcodecontoller: postalcodecontollerss,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FindBlock(function: () async {
                        KopoModel model = await Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Remedicopo(),
                          ),);
                        setState(() {
                          postalcodecontollerss.text = '${model.zonecode}';
                          address.text = '${model.address}';
                          stringprovider.setpostalcode('${model.zonecode}');
                          stringprovider.setadrress('${model.address}');
                        });
                      },),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Addresstextfield(nameController: address),
                SizedBox(height: 15),
                DetailAdress(
                  passwordController: detailadress,
                  hintextl: '상세주소',
                  isPassword: false,
                ),
              ]),
        SizedBox(height: 40),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "결재될 신용카드 정보를 입력해주세요",
                style: TextStyle(
                    color: Color(0xffd0d9e4),
                    fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text("입금하신 신용카드 정보로 충전요금이 결제됩니다", style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText),
            ),
          ),
        ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: optionsbank
        //       .map((option) => Expanded(
        //             child: RadioListTile(
        //               title: Text(
        //                 option.label,
        //                 style: TextStyle(color: Colors.white),
        //               ),
        //               value: option.value,
        //               groupValue: selectedoptionbank,
        //               onChanged: (value) {
        //                 // Update the selected option when the user selects a radio button
        //                 setState(() {
        //                   selectedoptionbank = value!;
        //                   print(selectedoptionbank);
        //                 });
        //               },
        //             ),
        //           ))
        //       .toList(),
        // ),
        SizedBox(height: 10),
        selectedoptionbank == '1'
            ? Container()
            : Container(
                child: Column(
                  children: [
                    TitleWidget(title: '사업자 번호', style: loginText),
                    SizedBox(height: 10),
                    Row(children: [
                      Expanded(
                          child: Govermnetcard(
                        function: (String value) {},
                        passwordController: nextcard1,
                        hintextl: '',
                        isPassword: false,
                        maxinput: 3,
                      )),
                      Expanded(
                          child: Govermnetcard(
                        function: (String value) {},
                        passwordController: nextcard2,
                        hintextl: '',
                        isPassword: false,
                        maxinput: 2,
                      )),
                      Expanded(
                          child: Govermnetcard(
                        function: (String value) {},
                        passwordController: nextcard3,
                        hintextl: '',
                        isPassword: false,
                        maxinput: 5,
                      )),
                    ]),
                  ],
                ),
              ),
        SizedBox(
          height: 20,
        ),
        TitleWidget(title: '카드 번호', style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText),
        SizedBox(
          height: 10,
        ),
        TextFieldWidget_CardBank(
          passwordController: debitcard,
          hintextl: '16자리',
          isPassword: false,
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  TitleWidget(
                    title: '유효 기간',
                    style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.zero,
                    ),
                    Expanded(
                        child: TextFieldCardExpireDate(
                      function: (String value) {
                        stringprovider.setchangebankcardmonthregist(value);
                      },
                      passwordController: month,
                      hintextl: 'MM',
                      isPassword: false,
                    )),
                    SizedBox(
                      child: Text('/', style: TextStyle(color: Colors.white)),
                    ),
                    Expanded(
                        child: TextFieldCardExpireDate(
                      function: (String value) {
                        stringprovider.setchangebankcardyearregist(value);
                      },
                      passwordController: year,
                      hintextl: 'YY',
                      isPassword: false,
                    )),
                  ]),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TitleWidget(
                    title: '카드 비밀번호 앞 2자리',
                    style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth > 600 ? 23 : 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: TextFieldCardPasswordBlock(
                      function: (String value) {
                        stringprovider.setchangebankcardpasswordregist(value);
                      },
                      passwordController: password,
                      hintextl: '',
                      isPassword: true,
                    )),
                    Expanded(
                        child: Text(
                      "**",
                      style: TextStyle(fontSize:  screenWidth > 900 || screenWidth > 600 ? 30 : 20, color: Colors.white),
                    )),
                  ]),
                ],

              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Register_User_Btn(number: selectedOption, id_p: stringprovider.id, function: ()  async {
          print(stringprovider.cardtype);
          print(stringprovider.carNumber);
          print("교통카드: $chargecardcompnay");
          print("사업자: $selectedoptionbank");
          NetworkHelper networkinghelper = NetworkHelper();
           await networkinghelper.registerUser(id, passwordController, name, bithday, gender,phone, selectedoptionbank, carname, chargecardcompnay, chargeCardNumber,bank_card_number, bank_card_month, bank_card_year,bank_card_password,stringprovider.carNumber, context);
        },),
        SizedBox(height: 30)
      ],
    ));
  }

}

class RadioOption {
  final String value;
  final String label;

  RadioOption({required this.value, required this.label});
}

class RadioOptions {
  final String value;
  final String label;

  RadioOptions({required this.value, required this.label});
}



void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShowSignSuccess(message: msg);
    },
  );
}

