import 'dart:convert';

import 'package:ev_charging_operation_system/components/MyPage/title/BankCardInfo.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/MyInfo.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/BankCard_title.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/ChargeCatd_title.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/MyPageTitle.dart';
import 'package:dio/dio.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/InfoWidget.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/screens/ChangeData.dart';
import '../networking/getdatas.dart';
import '../networking/networking.dart';
import '../screens/LoadingScreen.dart';
import 'CardRegisterBlock.dart';
import 'MyPage/Main/NavigatorContainer.dart';
import 'MyPage/changeBankCard/infocardpassword.dart';
import 'MyPage/changeBankCard/infoexpiredate.dart';
import 'MyPage/change_charge/Info_Widget_Input_CardNumber.dart';
import 'MyPage/title/ChargeCardInfo.dart';
import 'MyPage/changeBankCard/cancel_bank_button.dart';
import 'MyPage/changeBankCard/change_bank_button.dart';
import 'MyPage/changeBankCard/changeinfocard.dart';
import 'MyPage/change_bank/change_bank_btn.dart';
import 'MyPage/change_charge/Change_charge_button.dart';
import 'MyPage/title/Info_register_card.dart';
import 'MyPage/title/MyPageTitleSc.dart';
import 'MyPage/title/Myinfo_title.dart';
import 'MyPage/change_charge/ChangeChargeCard.dart';
import 'MyPage/changeInfoContainer/changeInfoContainer.dart';
import 'MyPage/change_button/change_button.dart';
import 'AlertWidget.dart';

enum Navigators {
  my_info,
  charge_info,
  nonpayment_info,
  my_info_change,
  charge_card_change,
  mycardchange,
  changeinputbank,
  changebank,
}

var data, unpaid_data;
Navigators selectednav = Navigators.my_info;

bool Cardnull = false;

String tokken = '';
String currentuser = '';

String email = '';
String name = '';
String phone = '';
String car = '';
String chargeCardCompanyName = '';
String chargeCardCompanyNumber = '';
String chargeCardRegisterDate = '';
String creditCardConpanyName = '';
String creditCardNumber = '';
String creditCardRegistDate = '';
String birth = '';
String gender = '';
int cardnumber = 0;
String carName = '';
String carIdx = '';
var datas;


var creditCardConpanyNameController = TextEditingController();



List<RadioOptions> options = [
  RadioOptions(value: '1', label: '개인 카드'),
  RadioOptions(value: '2', label: '법인 카드'),
];
String selectedOption = '1';

class MyPageBlock extends StatefulWidget {
  const MyPageBlock({Key? key, required this.datass, required this.datas, this.chargedata, this.unpaiddata})
      : super(key: key);
  final datass;
  final String datas;
  final chargedata;
  final unpaiddata;

  @override
  State<MyPageBlock> createState() => _MyPageBlockState();
}

class _MyPageBlockState extends State<MyPageBlock> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectednav = Navigators.my_info;
      tokken = context.read<DataMulti>().accestokken;
      currentuser = context.read<DataMulti>().currentuser;
      print('Tokken from mypage : ${tokken}');
      print('Tokken from mypage : ${currentuser}');
      updateUi(widget.datass, widget.chargedata, widget.unpaiddata);
      // getchargehistory();
    });
  }

  // void getchargehistory() async {
  //   // final provider =  Provider.of<DataMulti>(context);
  //   var weatherdata = await GetDatasmodel().datas();
  //   var
  //   data = weatherdata;
  //   print(data);
  // }

  void updateUi(dynamic weatherData, dynamic chargedata, dynamic unpaidata) {
    setState(() {
      unpaid_data =  unpaidata['data']['list'];
      data = chargedata['data']['list'];
      print(data);
      birth = weatherData['data']['user']['birth'];
      gender = weatherData['data']['user']['gender'];
      email = weatherData['data']['user']['id'];
      name = weatherData['data']['user']['name'];
      phone = weatherData['data']['user']['phone'];
      if (weatherData['data']['user']['carIdx'] == null) {
        carIdx = '';
      } else {
        carIdx = weatherData['data']['user']['carIdx'].toString();
      }
      if (weatherData['data']['user']['carName'] == null) {
        carName = '';
      } else {
        carName = weatherData['data']['user']['carName'];
      }
      cardnumber = weatherData['data']['user']['isRegistCreditCard'];
      if (weatherData['data']['user']['carNumber'] == null) {
        car = '';
      } else {
        car = weatherData['data']['user']['carNumber'];
      }
      chargeCardCompanyName =
          weatherData['data']['user']['chargeCardCompanyName'];
      chargeCardCompanyNumber = weatherData['data']['user']['chargeCardNumber'];
      chargeCardRegisterDate =
          weatherData['data']['user']['chargeCardRegistDate'];
      if (weatherData['data']['user']['creditCardCompanyName'] == null) {
        creditCardConpanyName = '';
        creditCardConpanyNameController.text = '';
      } else {
        creditCardConpanyName =
            weatherData['data']['user']['creditCardCompanyName'];
        creditCardConpanyNameController.text =
        weatherData['data']['user']['creditCardCompanyName'];
      }
      if (weatherData['data']['user']['creditCardNumber'] == null) {
        creditCardNumber = '';
      } else {
        creditCardNumber = weatherData['data']['user']['creditCardNumber'];
      }
      if (weatherData['data']['user']['creditCardRegistDate'] == null) {
        creditCardRegistDate = '';
      } else {
        creditCardRegistDate =
            weatherData['data']['user']['creditCardRegistDate'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataMulti>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      child: ListView(
        children: [
          SizedBox(height: 40),
          My_page_title(title: '마이페이지'),
          SizedBox(
            height: 20,
          ),
          buildContainer(),
          if (selectednav == Navigators.my_info)
            MainInfo(provider)
          else if (selectednav == Navigators.changebank)
            ChangeCard(screenWidth)
          else if (selectednav == Navigators.my_info_change)
            InfoCont(provider: provider)
          else if (selectednav == Navigators.nonpayment_info)
                nonpaymentContainer()
          else if (selectednav == Navigators.charge_info)
            chargeInfoContainer()
          else if (selectednav == Navigators.mycardchange)
            changeCardInfo()
          else if (selectednav == Navigators.charge_card_change)
            ChargeCardMidChange()
        ],
      ),
    );
  }

  Container chargeInfoContainer() {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                My_page_title(title: '충전내역'),
                SizedBox(height: 10),
                My_page_title_Sc(title: '연결된 충전카드로 결제된 내역만 확인 가능합니다'),
                SizedBox(height: 10),
                Container(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label:
                        Text('충전일자', style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s,)
                      ),
                      DataColumn(
                        label: Text('시도',style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s),
                      ),
                      DataColumn(
                        label: Text('군구',style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s),
                      ),
                      DataColumn(
                        label: Text('충전소',style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s),
                      ),
                      DataColumn(
                        label: Text('소요시간',style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s),
                      ),
                      DataColumn(
                        label: Text('충전 전력량',style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s),
                      ),
                      DataColumn(
                        label: Text('충전금액',style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s),
                      ),
                      DataColumn(
                        label: Text('결제금액',style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s),
                      ),
                      DataColumn(
                        label: Text('사용포인트',style: screenWidth > 900 || screenWidth  > 600 ? loginText_l : loginText_s),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      data.length,
                      (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(data[index]['registDate'], style: TextStyle(color: Colors.white, fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11),)),
                          DataCell(Text(data[index]['sido'], style: TextStyle(color: Colors.white,fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                          DataCell(Text(data[index]['gungu'], style: TextStyle(color: Colors.white,fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                          DataCell(Text(data[index]['stationName'], style: TextStyle(color: Colors.white,fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                          DataCell(Text(data[index]['leadTime'], style: TextStyle(color: Colors.white,fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                          DataCell(Text(data[index]['energy'], style: TextStyle(color: Colors.white,fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                          DataCell(Text(data[index]['chargeAmount'].toString(), style: TextStyle(color: Colors.white,fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                          DataCell(Text(data[index]['payment'].toString(), style: TextStyle(color: Colors.white,fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                          DataCell(Text(data[index]['usePoint'].toString(), style: TextStyle(color: Colors.white,fontSize:  screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          );
  }

  Container nonpaymentContainer() {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    My_page_title(title: '미납내역'),
                    SizedBox(height: 10),
                    Container(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: <DataColumn>[
                          DataColumn(
                              label:
                              Text('충전일자', style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText_s,)
                          ),
                          DataColumn(
                            label: Text('시도',style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText_s),
                          ),
                          DataColumn(
                            label: Text('군구',style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText_s),
                          ),
                          DataColumn(
                            label: Text('충전소',style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText_s),
                          ),
                          DataColumn(
                            label: Text('소요시간',style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText_s),
                          ),
                          DataColumn(
                            label: Text('충전 전력량',style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText_s),
                          ),
                          DataColumn(
                            label: Text('충전금액',style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText_s),
                          ),
                          DataColumn(
                            label: Text('미납금액',style: screenWidth > 900 || screenWidth > 600 ? loginText_l : loginText_s),
                          ),

                        ],
                        rows: List<DataRow>.generate(
                          data.length,
                              (index) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(unpaid_data[index]['registDate'], style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 || screenWidth  > 600 ? 23 : 11),)),
                              DataCell(Text(unpaid_data[index]['sido'], style: TextStyle(color: Colors.white,fontSize: screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                              DataCell(Text(unpaid_data[index]['gungu'], style: TextStyle(color: Colors.white,fontSize: screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                              DataCell(Text(unpaid_data[index]['stationName'], style: TextStyle(color: Colors.white,fontSize: screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                              DataCell(Text(unpaid_data[index]['leadTime'], style: TextStyle(color: Colors.white,fontSize: screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                              DataCell(Text(unpaid_data[index]['energy'], style: TextStyle(color: Colors.white,fontSize: screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                              DataCell(Text(unpaid_data[index]['chargeAmount'].toString(), style: TextStyle(color: Colors.white,fontSize: screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                              DataCell(Text(unpaid_data[index]['unpaidAmount'].toString(), style: TextStyle(color: Colors.white,fontSize: screenWidth > 900 || screenWidth  > 600 ? 23 : 11))),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              );
  }

  Container ChangeCard(double screenWidth) {
    var provider = Provider.of<DataMulti>(context, listen: false);
    return Container(
            child: Column(
              children: [
                SizedBox(height:screenWidth > 900 ? 50 :  30),
                My_page_title(title: cardnumber == 0 ?  '결제카드 등록': '결제카드 변경'),
                SizedBox(height: 20,),
                // ChangeInfoBankContainer(
                //   id: email,
                //   name: name,
                //   phone: phone,
                //   carNumber: car,
                //   birth: birth,
                //   gender: gender,
                // ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration:
          BoxDecoration(border: Border.all(width: 1, color: Color(0xff323b4f))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Info_Widget_Input_Card_Number(
              //     borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
              //     title: '카드번호',
              //     value: '교통카드'),
              Info_Widget_Input_Card_Numberx4(
                  borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
                  title: '카드번호',
                  value: '교통카드'),
              Info_Widget_Input_Card_Expire(
                  borderSide: BorderSide(width: 1, color: Color(0xff323b4f)),
                  title: '유효기간',
                  value: '교통카드'),
              Info_Widget_Input_Card_Password(
                  borderSide: BorderSide.none,
                  title: '카드 비밀번호 앞 2자리',
                  value: '교통카드'),
            ],
          ),
        ),
                SizedBox(height: 20),
                ChangeButtonCard(titletext: cardnumber == 0 ? '등록하기' : '변경하기', function: ()
                async {
                  // String cardnumber = provider.creditCardNumber.replaceAll('-','');
                  String creditCardExpireMonth = provider.creditCardExpireMonth;
                  String creditCardExpireYear = provider.creditCardExpireYear;
                  String creditCardpassword = provider.creditCardpassword;
                  String bithday = provider.bithdaty;
                  String error = '';

                  String cn1 = provider.creditcardregistnumber1;
                  String cn2 = provider.creditcardregistnumber2;
                  String cn3 = provider.creditcardregistnumber3;
                  String cn4 = provider.creditcardregistnumber4;

                  String cardnumber = cn1+cn2+cn3+cn4;
                  print(cardnumber);
                  print(creditCardExpireMonth);
                  print(creditCardExpireYear);
                  print(creditCardpassword);
                  print(bithday);

                  NetworkHelper networkHelper = NetworkHelper();
                  await networkHelper.changeCard(provider,context,cardnumber,creditCardExpireYear,creditCardExpireMonth,creditCardpassword,bithday,error);

                  provider.setcreditcardregistnumber1('');
                  provider.setcreditcardregistnumber2('');
                  provider.setcreditcardregistnumber3('');
                  provider.setcreditcardregistnumber4('');

                },),
                SizedBox(height: 20),
                CancelButtonCard(
                  function: () {
                    setState(() {
                      selectednav = Navigators.my_info;
                    });
                  },
                )
              ],
            ),
          );
  }

  Container MainInfo(DataMulti provider) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      child: Column(
        children: [
          SizedBox(height: screenWidth > 900 ? 65 : 40),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [My_page_title(title: '기본정보'), buildtitle()]),
          SizedBox(height: screenWidth > 900 ? 16 : 10),
          My_info_container(
            id: email,
            name: name,
            phone: phone,
            carNumber: car == '' ? car : '(${car})',
            carName: carName,
          ),
          SizedBox(height:  screenWidth > 900 ? 40 : 25,),
          Divider(
            thickness: 3,
            color: Color(0xff2c3949),
          ),
          SizedBox(height:  screenWidth > 900 ? 40 : 25,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            My_page_title(title: '충전카드'),
            Container(
                width:  screenWidth > 900 || screenWidth > 600 ? 200 :  120,
                height:  screenWidth > 900 || screenWidth > 600 ? 40 : 25,
                margin: EdgeInsets.only(right: 35),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectednav = Navigators.charge_card_change;
                      provider.setnewvalueofChargeCardNumber(
                          chargeCardCompanyNumber);
                    });
                  },
                  child: Text(
                    '충전카드 변경',
                    style: TextStyle(fontSize:  screenWidth > 900 || screenWidth > 600 ? 25 : 12),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff73839e),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth > 900 || screenWidth > 600 ? 20 : 10))),
                ))
          ]),
          SizedBox(height:  screenWidth > 900 ? 20 : 10),
          ChargeCard_Container(
            chargeCardCompanyName: chargeCardCompanyName,
            chargeCardCompanyNumber: chargeCardCompanyNumber,
            chargeCardRegisterDate: chargeCardRegisterDate,
          ),
          SizedBox(height:  screenWidth > 900 ? 40 : 25,),
          Divider(
            thickness: 3,
            color: Color(0xff2c3949),
          ),
          SizedBox(height:  screenWidth > 900 ? 40 : 25,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            My_page_title(title: cardnumber == 0 ? '결제카드 등록' : '결제카드 변경'),
            cardnumber == 0
                ? Container()
                : Container(
                width:  screenWidth > 900 ? 200 :  100,
                height:  screenWidth > 900 ? 40 : 25,
                    margin: EdgeInsets.only(right: 35),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectednav = Navigators.mycardchange;
                        });
                      },
                      child: Text(
                        cardnumber == 0 ? '결제카드 등록' : '결제카드 변경',
                        style: TextStyle(fontSize:  screenWidth > 900 ? 25 : 12),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff73839e),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ))
          ]),
          SizedBox(height: screenWidth > 900 || screenWidth > 600 ? 30 : 20),
          cardnumber == 0
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xff323b4f))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Info_register_card(
                        borderSide: BorderSide.none,
                        title: '등록/변경일자',
                        value: creditCardRegistDate,
                        function: () {
                          setState(() {
                            selectednav = Navigators.changebank;
                          });
                        },
                      ),
                    ],
                  ),
                )
              : BankCard_Container(
                  creditCardConpanyName: creditCardConpanyNameController,
                  creditCardNumber: creditCardNumber,
                  creditCardRegistDate: creditCardRegistDate,
                ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }

  Container changeCardInfo() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          My_page_title(title: '결제카드 변경'),
          SizedBox(height: 20),
          BankCard_Container(
            creditCardConpanyName: creditCardConpanyNameController,
            creditCardNumber: creditCardNumber,
            creditCardRegistDate: creditCardRegistDate,
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                '변경하기',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
              onPressed: () async {
                setState(() {
                  selectednav = Navigators.changebank;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                primary: Color(0xff0aaff0),
                onPrimary: Colors.white, // set the text color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // set the border radius
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildtitle() {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
        width:  screenWidth > 900 || screenWidth > 600  ? 200 :  100,
        height:  screenWidth > 900 || screenWidth > 600  ? 40 : 25,
        margin: EdgeInsets.only(right: 35),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectednav = Navigators.my_info_change;
              print(selectednav);
            });
          },
          child: Text(
            '내 정보 수정',
            style: TextStyle(fontSize: screenWidth > 900 || screenWidth > 600  ?  25 : 12),
          ),
          style: ElevatedButton.styleFrom(
              primary: Color(0xff73839e),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth > 900 || screenWidth > 60 ? 20 : 10))),
        ));
  }

  Container buildContainer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Navigation_container(
                text: '내정보',
                backgr: selectednav == Navigators.my_info ||
                        selectednav == Navigators.my_info_change ||
                        selectednav == Navigators.charge_card_change ||
                        selectednav == Navigators.mycardchange ||
                        selectednav == Navigators.changebank
                    ? Color(0xff2e3848)
                    : Color(0xff27303f),
                textColor: selectednav == Navigators.my_info ||
                        selectednav == Navigators.my_info_change ||
                        selectednav == Navigators.charge_card_change ||
                        selectednav == Navigators.mycardchange ||
                        selectednav == Navigators.changebank
                    ? Colors.white
                    : Color(0xff9aaed1),
                side: selectednav == Navigators.my_info ||
                        selectednav == Navigators.my_info_change ||
                        selectednav == Navigators.charge_card_change ||
                        selectednav == Navigators.mycardchange ||
                        selectednav == Navigators.changebank
                    ? Color(0xff2e3848)
                    : Color(0xff2e3848),
                function: () {
                  setState(() {
                    selectednav = Navigators.my_info;
                    print(selectednav);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Center(
                child: Navigation_container(
              text: '충전내역',
              backgr: selectednav == Navigators.charge_info
                  ? Color(0xff2e3848)
                  : Color(0xff27303f),
              textColor: selectednav == Navigators.charge_info
                  ? Colors.white
                  : Color(0xff9aaed1),
              side: selectednav == Navigators.charge_info
                  ? Color(0xff2e3848)
                  : Color(0xff2e3848),
              function: () {
                selectednav = Navigators.charge_info;
                setState(() {
                  selectednav = Navigators.charge_info;
                  print(selectednav);
                });
              },
            )),
          ),
          Expanded(
            child: Center(
                child: Navigation_container(
              text: '미납내역',
              backgr: selectednav == Navigators.nonpayment_info
                  ? Color(0xff2e3848)
                  : Color(0xff27303f),
              textColor: selectednav == Navigators.nonpayment_info
                  ? Colors.white
                  : Color(0xff9aaed1),
              side: selectednav == Navigators.nonpayment_info
                  ? Color(0xff2e3848)
                  : Color(0xff2e3848),
              function: () {
                setState(() {
                  selectednav = Navigators.nonpayment_info;
                  print(selectednav);
                });
              },
            )),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xff323b4f)))),
    );
  }
}

class ChargeCardMidChange extends StatelessWidget {
  const ChargeCardMidChange({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataMulti>(context);
    String error = '';
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          My_page_title(title: '충전카드 변경'),
          SizedBox(height: 20),
          ChangehChrgeContainers(
            CardCompanyName: chargeCardCompanyName,
            CardCompanyNumber: chargeCardCompanyNumber,
          ),
          SizedBox(height: 25),
          ChangeButtonCard(titletext: '충전카드 수정하기', function: ()
          async {
            NetworkHelper networking = NetworkHelper();
            await  networking.changechargecard(provider, context, error);

          },),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}

class InfoCont extends StatelessWidget {
  const InfoCont({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final DataMulti provider;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            My_page_title(title: '기본정보 수정'),
            Container(
                margin: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Center(
                                child: Column(children: [
                              // Image(image: AssetImage('img/icons/png.png'), fit: BoxFit.cover),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'NOTICE',
                                style: TextStyle(color: Color(0xff0aaff0)),
                              )
                            ])),
                            backgroundColor: Color(0xff26303f),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '탈퇴하시겠습니까?',
                                    style: TextStyle(color: Colors.white, fontSize: screenWidth > 900 ||  screenWidth > 600 ? 24 : 13),
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            delteaccount(context, provider);
                                          },
                                          child: Text('OK'),
                                        ),
                                        SizedBox(width: 10),
                                        OutlinedButton(
                                          child: Text(
                                            '아니요',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xff02aff0))),
                                        ),
                                      ]),
                                ]));
                      },
                    );
                  },
                  child: Text('탈퇴하기', style: TextStyle(fontSize: screenWidth > 900 || screenWidth > 600 ? 24 : 13),),
                ))
          ]),
          SizedBox(height: 10),
          ChangeInfoContainer(
            carIdx: carIdx,
            id: email,
            name: name,
            phone: phone,
            carNumber: car,
            birth: birth,
            gender: gender,
          ),
          SizedBox(height: 25),
          ChangeButton(),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}

class Myinfo_title extends StatelessWidget {
  const Myinfo_title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      My_page_title(title: '기본정보'),
      Container(
          width: 100,
          height: 25,
          margin: EdgeInsets.only(right: 35),
          child: ElevatedButton(
            onPressed: () {
              selectednav = Navigators.nonpayment_info;
            },
            child: Text(
              '내 정보 수정',
              style: TextStyle(fontSize: 12),
            ),
            style: ElevatedButton.styleFrom(
                primary: Color(0xff73839e),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ))
    ]);
  }
}
void showMyDialogs(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertUpdateSuccess(message: msg);
    },
  );
}

void showMyDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDeleteSuccess(message: msg);
    },
  );
}

void delteaccount(BuildContext context, var provider) async {
  String token = provider.accestokken;
  final dio = Dio();
  final url = 'http://139.150.72.173:3000/user';
  final headers = {'Authorization': 'Bearer $token'};

  try {
    final response = await dio.delete(
      url,
      options: Options(
        headers: headers,
      ),
    );
    showMyDialog(context, '회원이 탈퇴했습니다');
  } catch (e) {
    print(e);
  }
}


void showMyDialogerror(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertShow(message: msg);
    },
  );
}
