import 'package:ev_charging_operation_system/components/MyPage/title/BankCardInfo.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/MyInfo.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/BankCard_title.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/ChargeCatd_title.dart';
import 'package:flutter/material.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/MyPageTitle.dart';
import 'package:dio/dio.dart';
import 'package:ev_charging_operation_system/model/UseMultiProvider.dart';
import 'package:ev_charging_operation_system/components/MyPage/title/InfoWidget.dart';
import 'package:provider/provider.dart';
import 'package:ev_charging_operation_system/screens/ChangeData.dart';
import 'CardRegisterBlock.dart';
import 'MyPage/Main/NavigatorContainer.dart';
import 'MyPage/title/ChargeCardInfo.dart';
import 'MyPage/changeBankCard/cancel_bank_button.dart';
import 'MyPage/changeBankCard/change_bank_button.dart';
import 'MyPage/changeBankCard/changeinfocard.dart';
import 'MyPage/change_bank/change_bank_btn.dart';
import 'MyPage/change_charge/Change_charge_button.dart';
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
  changebank
}

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
var datas;

List<RadioOptions> options = [
  RadioOptions(value: '1', label: '개인 카드'),
  RadioOptions(value: '2', label: '법인 카드'),
];
String selectedOption = '1';

class MyAppBlock extends StatefulWidget {
  const MyAppBlock({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  State<MyAppBlock> createState() => _MyPageBlockState();
}

class _MyPageBlockState extends State<MyAppBlock> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data);
    if (widget.data == '1') {
      setState(() {
        selectednav = Navigators.my_info;
      });
    } else {
      setState(() {
        selectednav = Navigators.changebank;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      child: ListView(
        children: [
          SizedBox(height: 40),
          buildContainer(),
          if (selectednav == Navigators.my_info)
            Container(
                child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '회원가입 절차',
                            style: TextStyle(
                              color: Color(0xff2ba0b9),
                              fontSize: screenWidth > 900 ? 70 : screenWidth > 600 ? 55 : 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Membership Registration Guide',
                            style: TextStyle(
                                color: Color(0xff8394b2),
                                fontSize: screenWidth > 900 ? 25 : screenWidth > 600 ? 17 : 15,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      Image.asset(
                        'img/yellow_file.jpeg',
                        scale: screenWidth > 900 ? 10 : screenWidth > 600 ? 2 : 3,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth > 900 || screenWidth > 600 ?  22 : 20,
                ),
                UseGuide(imageUrl: 'img/item_f.png', text: '회원가입 하기 Click!'),
                SizedBox(
                    height: screenWidth > 900 || screenWidth > 600 ? 22 : 20),
                UseGuide(imageUrl: 'img/icon_sc.jpeg', text: '약관에 동의해 주세요!'),
                SizedBox(
                    height: screenWidth > 900 || screenWidth > 600 ? 22 : 20),
                UseGuide(
                    imageUrl: 'img/icon_th.jpeg',
                    text: "'다음'을 클릭하면 본인 인증 절차가 진행됩니다"),
                SizedBox(
                    height: screenWidth > 900 || screenWidth > 600 ? 22 : 20),
                UseGuideFourth(
                  imageUrl: 'img/icon_four.jpeg',
                  text: '인증이 완료되면, 기본정보를 입력해주세요.',
                  texts: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '등록한 ',
                            style: TextStyle(
                                color: Color(0xff879baf),
                                fontSize: screenWidth > 900 || screenWidth > 600 ? 20 : 15)),
                        TextSpan(
                          text: '이메일 본인의 아이디',
                          style: TextStyle(
                              color: Color(0xff8fcb51),
                              fontSize: screenWidth > 900 || screenWidth > 600 ? 20
                                  : 15 // set the text color to green
                              ),
                        ),
                        TextSpan(
                            text: '로 사용됩니다',
                            style: TextStyle(
                                color: Color(0xff879baf),
                                fontSize: screenWidth > 900 || screenWidth > 600 ? 20 : 15)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenWidth > 900 || screenWidth > 600 ? 40 : 20),
                UseGuideFives(
                  imageUrl: 'img/icon_five.jpeg',
                  text: '충전카드를  등록해주세요.',
                  texts: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text:
                                '충전카드는 교통카드, 환경부 멤버십카드, 사업자카드 중 택일 (RFID 번호 16자리 필요) 교통카드나 환경부 멤버십카드 등록  시 카드 번호를 확인해주세요.신용카드 / 체크카드 번호와 다릅니다.',
                            style: TextStyle(
                                color: Color(0xff879baf),
                                fontSize: screenWidth > 900 || screenWidth > 600 ? 17 : 15)),
                        TextSpan(
                          text:
                              '\n신용카드 / 체크카드를 충전카드로 등록 하시면 충전기에서 인식이 되지 않습니다\n',
                          style: TextStyle(
                              color: Color(0xff8fcb51),
                              fontSize: screenWidth > 900 || screenWidth > 600 ? 20
                                  : 13 // set the text color to green
                              ),
                        ),
                      ],
                    ),
                  ),
                  function: () {
                    setState(() {
                      selectednav = Navigators.changebank;
                      print(selectednav);
                    });
                  },
                ),
                SizedBox(height: screenWidth > 900 || screenWidth > 600 ? 40 : 20),
                UseGuideFourth(
                  imageUrl: 'img/icon_six.jpeg',
                  text: '결재카드를 등록해주세요.',
                  texts: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '결재카드는 개인신용 / 체크카드 , 법인카드를 등록하시면 됩니다 .',
                            style: TextStyle(
                                color: Color(0xff879baf),
                                fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
                        TextSpan(
                          text: '\n카드번호 (16 자리 ), 유효기간',
                          style: TextStyle(
                              color: Color(0xff8fcb51),
                              fontSize: screenWidth > 900 || screenWidth > 600 ? 23
                                  : 13 // set the text color to green
                              ),
                        ),
                        TextSpan(
                          text: '을 입력해주세요',
                          style: TextStyle(
                              color: Color(0xff879baf),
                              fontSize: screenWidth > 900 || screenWidth > 600 ? 23
                                  : 13 // set the text color to green
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ))
          else if (selectednav == Navigators.changebank)
            Container(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    color: Color(0xff293243),
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  '충전카드',
                                  style: TextStyle(
                                      color: Color(0xff2ba0b9),
                                      fontSize: screenWidth > 900 || screenWidth > 600 ? 100 : 45,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Image.asset(
                                'img/yellow_file_short.jpeg',
                                scale: screenWidth > 900 || screenWidth > 600 ? 1 : 3,
                              ),
                              Container(
                                child: Text(
                                  '등록시',
                                  style: TextStyle(
                                      color: Color(0xff2ba0b9),
                                      fontSize: screenWidth > 900 || screenWidth > 600 ? 120 : 45,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '유의점',
                                  style: TextStyle(
                                      color: Color(0xff2ba0b9),
                                      fontSize: screenWidth > 900 || screenWidth > 600 ? 120 : 45,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Image.asset(
                          'img/hands.jpeg',
                        ))
                      ],
                    ),
                  ),
                  ChargeCardContainer(
                    imageUrl: 'img/brace.jpeg',
                    text: '신용카드나 체크카드 번호를\n등록하시면 안됩니다!',
                    texts: Text('신용카드나 체크카드는 결재카드에 등록해주세요.',
                        style: TextStyle(
                            color: Color(0xff879baf),
                            fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
                    function: () {
                      setState(() {
                        selectednav = Navigators.changebank;
                        print(selectednav);
                      });
                    },
                  ),
                  SizedBox(height: 50),
                  ChargeCardContainerSc(
                    imageUrl: 'img/brace.jpeg',
                    text: '교통카드, 환경부 멤버십카드, 사업자카드만!',
                    texts: Text(
                        '실물 신용/체크카드 번호와 교통카드 번호는 서로 다릅니다.충전카드는 교통카드 번호, 환경부 공공충전인프라 멤버십카드 번호, 사업자카드의 카드번호(RFID)만 등록하셔야 합니다.',
                        style: TextStyle(
                            color: Color(0xff879baf),
                            fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
                    function: () {
                      setState(() {
                        selectednav = Navigators.changebank;
                        print(selectednav);
                      });
                    },
                    textss: Text(
                        "실물 플라스틱 카드의 경우, 카드 후면에 고유번호(RFID)가 기재되어 있습니다.",
                        style: TextStyle(
                            color: Color(0xff879baf),
                            fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
                    textsss: Text(
                        '모바일 티머니, 삼성페이 티머니 등에 등록해서 후불형으로 사용하는 경우에는,실물 신용/체크카드 번호가 아닌 모바일 교통카드 앱에 부여된 번호를 입력하셔야 합니다',
                        style: TextStyle(
                            color: Color(0xff879baf),
                            fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
                    textssss: Text('신용카드나 체크카드의 번호를 등록하시면, 충전기에서 인식이 되지 않습니다.',
                        style: TextStyle(
                            color: Color(0xff879baf),
                            fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20)
                ],
              ),
            )
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Navigation_container(
                text: '회원가입 절차',
                backgr: selectednav == Navigators.my_info
                    ? Color(0xff2e3848)
                    : Color(0xff27303f),
                textColor: selectednav == Navigators.my_info
                    ? Colors.white
                    : Color(0xff9aaed1),
                side: selectednav == Navigators.my_info
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
            flex: 3,
            child: Center(
                child: Navigation_container(
              text: '교통카드 등록 시 유의점',
              backgr: selectednav == Navigators.changebank
                  ? Color(0xff2e3848)
                  : Color(0xff27303f),
              textColor: selectednav == Navigators.changebank
                  ? Colors.white
                  : Color(0xff9aaed1),
              side: selectednav == Navigators.changebank
                  ? Color(0xff2e3848)
                  : Color(0xff2e3848),
              function: () {
                selectednav = Navigators.changebank;
                setState(() {
                  selectednav = Navigators.changebank;
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

class UseGuide extends StatelessWidget {
  const UseGuide({
    Key? key,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  final String imageUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            imageUrl,
            scale: screenWidth > 900 ? 1 : 2,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 10,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15),
          ),
        )
      ]),
    );
  }
}

class UseGuideFourth extends StatelessWidget {
  const UseGuideFourth({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.texts,
  }) : super(key: key);

  final String imageUrl;
  final String text;
  final Text texts;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            imageUrl,
            scale: screenWidth > 900  ? 1 : 2,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 10,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth > 900 || screenWidth > 600 ? 23: 15)),
            SizedBox(height: 10),
            texts
          ]),
        )
      ]),
    );
  }
}

class UseGuideFives extends StatefulWidget {
  const UseGuideFives({
    Key? key,
    required this.imageUrl,
    required this.text,
    required this.texts,
    required this.function,
  }) : super(key: key);

  final String imageUrl;
  final String text;
  final Text texts;
  final Function function;

  @override
  State<UseGuideFives> createState() => _UseGuideFivesState();
}

class _UseGuideFivesState extends State<UseGuideFives> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            widget.imageUrl,
            scale: screenWidth > 900 ? 1 : 2,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 10,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth > 900  ? 25 :   screenWidth > 600 ? 25 : 15)),
            SizedBox(height: 10),
            widget.texts,
            TextButton(
              onPressed: () {
                widget.function();
              },
              child: Text('충전카드 등록 시 유의점 참고 (링크)',
                  style: TextStyle(
                      color: Color(0xff07acea),
                      fontSize: screenWidth > 900 || screenWidth > 600 ? 20 : 15)),
            ),
          ]),
        )
      ]),
    );
  }
}

class ChargeCardContainer extends StatefulWidget {
  const ChargeCardContainer(
      {Key? key,
      required this.imageUrl,
      required this.text,
      required this.texts,
      required this.function})
      : super(key: key);
  final String imageUrl;
  final String text;
  final Text texts;
  final Function function;

  @override
  State<ChargeCardContainer> createState() => _ChargeCardContainerState();
}

class _ChargeCardContainerState extends State<ChargeCardContainer> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            widget.imageUrl,
            scale: screenWidth > 900 || screenWidth > 600 ? 1 : 2,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 10,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 17)),
            SizedBox(height: 10),
            Row(children: [
              Image.asset(
                'img/gun.jpeg',
                scale: screenWidth > 900 || screenWidth > 600 ? 1 : 2,
              ),
              SizedBox(width: 3),
              widget.texts
            ]),
          ]),
        )
      ]),
    );
  }
}

class ChargeCardContainerSc extends StatefulWidget {
  const ChargeCardContainerSc(
      {Key? key,
      required this.imageUrl,
      required this.text,
      required this.texts,
      required this.function,
      required this.textss,
      required this.textsss,
      required this.textssss})
      : super(key: key);
  final String imageUrl;
  final String text;
  final Text texts;
  final Text textss;
  final Text textsss;
  final Text textssss;
  final Function function;

  @override
  State<ChargeCardContainerSc> createState() => _ChargeCardContainerScState();
}

class _ChargeCardContainerScState extends State<ChargeCardContainerSc> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            widget.imageUrl,
            scale: screenWidth > 900 || screenWidth > 600 ? 1 : 2,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 10,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth > 900 || screenWidth > 600 ? 34 : 17)),
            SizedBox(height: 10),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset('img/gun.jpeg', scale: screenWidth > 900 || screenWidth > 600 ? 1 : 2),
              SizedBox(width: 3),
              Expanded(child: widget.texts)
            ]),
            SizedBox(
              height: 20,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                'img/gun.jpeg',
                scale: screenWidth > 900 || screenWidth > 600 ? 1 : 2,
              ),
              SizedBox(width: 3),
              Expanded(child: widget.textss)
            ]),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Image.asset('img/title_main2.jpeg')),
            SizedBox(
              height: 10,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset('img/gun.jpeg', scale: screenWidth > 900 || screenWidth > 600 ? 1 : 2),
              SizedBox(width: 3),
              Expanded(child: widget.textsss)
            ]),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Image.asset('img/title_card2.jpeg')),
            SizedBox(
              height: 10,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset('img/gun.jpeg', scale: screenWidth > 900 || screenWidth > 600 ? 1 : 2),
              SizedBox(width: 3),
              Expanded(child: widget.textssss)
            ]),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Image.asset('img/title_last.jpeg')),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('신용카드\n체크카드\n번호는 안되요',
                                  style: TextStyle(
                                      fontSize: screenWidth > 900 || screenWidth > 600 ? 50 : 25,
                                      color: Color(0xff349eb2),
                                      fontWeight: FontWeight.w600))))
                    ])),
          ]),
        )
      ]),
    );
  }
}
