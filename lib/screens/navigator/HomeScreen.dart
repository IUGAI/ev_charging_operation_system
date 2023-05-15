import 'package:ev_charging_operation_system/components/MyAppGuideBlock.dart';
import 'package:ev_charging_operation_system/components/SignUp/Widget_of_Name.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:ev_charging_operation_system/components/LoginBlock.dart';
import 'package:ev_charging_operation_system/constant/constant.dart';

import '../../components/AlertWidget.dart';

enum Distance { none, onekm, fivekm, tenkm, twenty }

enum Distanceisopen { open, close }

Distanceisopen distanceisopen = Distanceisopen.close;
Distance distance = Distance.none;

String dropdownValue = 'Option 1';

bool inkmisclicked = false;
bool chargertypeisclicked = false;
bool bussinessisclicked = false;

final List<String> _dropdownValueslm = ["범위", "1km", "5km", "10km", "20km","30km"];

final List<String> _dropdownValues = ["충전기", "1대이상", "1대이상", "1대이상", "상관없음"];

class HomeScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<HomeScreen> {
  String datafilter = '';
  List<MyData> myDataList = [];
  bool isLoading = false;
  bool isFilter = false;

  bool isclicked1 = false;
  bool isclicked2 = false;
  bool isclicked3 = false;
  bool isclicked4 = false;

  bool isclicked5 = false;
  bool isclicked6 = false;
  bool isclicked7 = false;
  bool isclicked8 = false;
  bool isclicked9 = false;

  bool isclicked10 = false;
  bool isclicked11 = false;
  bool isclicked12 = false;
  bool isclicked13 = false;

  bool isclicked14 = false;
  bool isclicked15 = false;
  bool isclicked16 = false;
  bool isclicked17 = false;
  bool isclicked18 = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    try {
      Response response = await Dio().get(
          'http://192.168.77.172:5000/distance/chstation',
          queryParameters: {'lat1': '37.52126', 'lon1': '126.91327'});
      setState(() {
        myDataList = List<MyData>.from(
            response.data['data'].map((data) => MyData.fromJson(data)));
      });
    } catch (error) {
      print('Error message: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchFilterData(String filter) async {
    setState(() {
      isLoading = true;
    });
    try {
      final dio = Dio();
      dio.options.connectTimeout = Duration(seconds: 5);

      Response response = await dio.get(
          'http://192.168.77.172:5000/distance/chstation',
          queryParameters: {
            'lat1': '37.52126',
            'lon1': '126.91327',
            'filter': filter
          });
      setState(() {
        myDataList = List<MyData>.from(
            response.data['data'].map((data) => MyData.fromJson(data)));
      });
    } catch (error) {
      print('Error message: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a475c),
        title: Text(appBarText,
            style: TextStyle(
                fontSize: screenWidth > 900 || screenWidth > 600 ? 23 : 15)),
      ),
      body: Stack(children: [
        AnimatedOpacity(
          duration: Duration(microseconds: 500),
          opacity: isFilter ? 0.5 : 1.0,
          child: Container(
            color: Color(0xff26303F),
            child: Column(children: [
              Divider(),
              Row(children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    height:
                        50, // Set a fixed height for the horizontal ListView
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // Add your horizontal ListView items here
                        FilterSettings(
                          title: '',
                          imgurl: isclicked10
                              ? 'img/filed3.png'
                              : 'img/unfiled3.png',
                          isimg: true,
                          clicked: isclicked10,
                        ),
                        SizedBox(width: 10),
                        FilterSettings(
                          title: '',
                          imgurl: isclicked11
                              ? 'img/filed4.png'
                              : 'img/unfiled4.png',
                          isimg: true,
                          clicked: isclicked11,
                        ),

                        SizedBox(width: 10),
                        FilterSettings(
                          title: '',
                          imgurl: isclicked12
                              ? 'img/filed1.png'
                              : 'img/unfiled1.png',
                          isimg: true,
                          clicked: isclicked12,
                        ),

                        SizedBox(width: 10),

                        FilterSettings(
                          title: '',
                          imgurl: isclicked13
                              ? 'img/filed2.png'
                              : 'img/unfiled2.png',
                          isimg: true,
                          clicked: isclicked13,
                        ),
                        SizedBox(width: 10),
                        FilterSettings(
                          title: '완속',
                          imgurl: '',
                          isimg: false,
                          clicked: isclicked14,
                        ),
                        SizedBox(width: 10),
                        FilterSettings(
                          title: '급속',
                          imgurl: '',
                          isimg: false,
                          clicked: isclicked15,
                        ),
                        SizedBox(width: 10),
                        FilterSettings(
                          title: '유료',
                          imgurl: '',
                          isimg: false,
                          clicked: isclicked16,
                        ),
                        SizedBox(width: 10),
                        FilterSettings(
                          title: '무료',
                          imgurl: '',
                          isimg: false,
                          clicked: isclicked17,
                        ),

                        SizedBox(width: 10),
                        FilterSettings(
                          title: '지금',
                          imgurl: '',
                          isimg: false,
                          clicked: isclicked18,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (isFilter) {
                          isFilter = false;
                        } else {
                          isFilter = true;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.settings,
                      color: isFilter ? Color(0xff0dc0ff) : Colors.grey,
                      size: 40,
                    ),
                  ),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: [
                  Expanded(
                      flex: 3,
                      child: DropDownWidget(
                        isclicked: inkmisclicked,
                        function: () {
                          setState(() {
                            distanceisopen = Distanceisopen.open;
                          });
                          return showMyDialogerror(context);
                        },
                        title: '범위',
                      )),
                  const SizedBox(width: 20),
                  Expanded(
                      flex: 3,
                      child: DropDownWidget(
                        isclicked: chargertypeisclicked,
                        function: () {
                          setState(() {
                            if (!chargertypeisclicked) {
                              chargertypeisclicked = true;
                            }
                          });
                          // return showDialog(
                          //   return null
                          // );
                        },
                        title: '충전기',
                      )),
                  const SizedBox(width: 20),
                  Expanded(
                      flex: 3,
                      child: DropDownWidget(
                        isclicked: bussinessisclicked,
                        function: () {
                          setState(() {
                            if (bussinessisclicked) {
                              bussinessisclicked = false;
                            } else {
                              bussinessisclicked = true;
                            }
                          });
                          // return showalertfiltersettings(context);
                        },
                        title: '사업자',
                      ))
                ]),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(3),
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: myDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            MyData myData = myDataList[index];
                            return Card(
                              // shape: RoundedRectangleBorder(
                              //   side: BorderSide.(width: 1, color: Color(0xff71809B))
                              // ),
                              color: Color(0xff26303F),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Divider(color: Color(0xff808080)),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Container(
                                            width: 280,
                                            child: Text(myData.chargename,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: "InterSemiBold",
                                                    fontWeight:
                                                        FontWeight.w600))),
                                        Text(
                                            '${myData.inkm > 1000 ? (myData.inkm / 1000).toStringAsFixed(1) + "km" : myData.inkm.toString() + "m"}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "InterSemiBold",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w100)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ChargeStationInfoContainer(
                                          title: '사용가능',
                                          value: myData.usewailable.toString(),
                                          value_f:
                                              '/${myData.useable.toString()}',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ChargeStationInfoContainer(
                                          title: '운영시간',
                                          value: '24',
                                          value_f: '/h',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ChargeStationInfoContainer(
                                          title: '충전용량',
                                          value: myData.chargeKw == 'kw'
                                              ? '-'
                                              : myData.chargeKw,
                                          value_f: '/kw',
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ChargeStationInfoContainer(
                                          title: '충전요금',
                                          value: myData.chargefee,
                                          value_f: '',
                                        ),
                                      ]),
                                  SizedBox(height: 20),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            myData.usealavailable,
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white,
                                              fontFamily: "InterSemiBold",
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('*',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(myData.chargetype,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontFamily: "InterSemiBold",
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('*',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(myData.companyname,
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontFamily: "InterSemiBold",
                                              )),
                                        ]),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ButtonWidget2(
                                          text: '상세보기',
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ButtonWidget2(
                                          text: '지도에서 보기',
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        ButtonWidget(
                                          text: '길 안내',
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ),
            ]),
          ),
        ),
        isFilter
            ? Center(
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(color: Color(0xff26303F)),
                  child: ListView(
                    children: <Widget>[
                      Center(
                        child: Text(
                          '필터 설정',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(thickness: 1, color: Color(0xff71809B)),
                      Row(
                        children: [
                          Expanded(
                              child: ChargerType(
                            function: () {
                              if (isclicked1) {
                                setState(() {
                                  isclicked1 = false;
                                });
                              } else {
                                setState(() {
                                  isclicked1 = true;
                                });
                              }
                            },
                            text: 'DC 콤보(급속)',
                            imagUrl: isclicked1
                                ? 'img/filed3.png'
                                : 'img/unfiled3.png',
                            isimg: true,
                            title: '',
                            clicked: isclicked1,
                          )),
                          Expanded(
                              child: ChargerType(
                            function: () {
                              if (isclicked2) {
                                setState(() {
                                  isclicked2 = false;
                                });
                              } else {
                                setState(() {
                                  isclicked2 = true;
                                });
                              }
                            },
                            text: 'DC 차데모(급속)',
                            imagUrl: isclicked2
                                ? 'img/filed4.png'
                                : 'img/unfiled4.png',
                            isimg: true,
                            title: '',
                            clicked: isclicked2,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ChargerType(
                            function: () {
                              if (isclicked3) {
                                setState(() {
                                  isclicked3 = false;
                                });
                              } else {
                                setState(() {
                                  isclicked3 = true;
                                });
                              }
                            },
                            text: 'AC (완속)',
                            imagUrl: isclicked3
                                ? 'img/filed1.png'
                                : 'img/unfiled1.png',
                            isimg: true,
                            title: '',
                            clicked: isclicked3,
                          )),
                          Expanded(
                              child: ChargerType(
                            function: () {
                              if (isclicked4) {
                                setState(() {
                                  isclicked4 = false;
                                });
                              } else {
                                setState(() {
                                  isclicked4 = true;
                                });
                              }
                            },
                            text: 'AC 3상(급속) ',
                            imagUrl: isclicked4
                                ? 'img/filed2.png'
                                : 'img/unfiled2.png',
                            isimg: true,
                            title: '',
                            clicked: isclicked4,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(thickness: 1, color: Color(0xff71809B)),
                      Row(
                        children: [
                          Expanded(
                              child: ChargerType(
                            text: '완속',
                            imagUrl: isclicked5
                                ? 'img/tutilefilled.png'
                                : 'img/turtleunfilled.png',
                            isimg: true,
                            title: '',
                            function: () {
                              if (isclicked5) {
                                setState(() {
                                  isclicked5 = false;
                                });
                              } else {
                                setState(() {
                                  isclicked5 = true;
                                });
                              }
                            },
                            clicked: isclicked5,
                          )),
                          Expanded(
                              child: ChargerType(
                            function: () {
                              if (isclicked6) {
                                setState(() {
                                  isclicked6 = false;
                                });
                              } else {
                                setState(() {
                                  isclicked6 = true;
                                });
                              }
                            },
                            text: '급속',
                            imagUrl: isclicked6
                                ? 'img/rabbitfiled.png'
                                : 'img/rabbitunfiled.png',
                            isimg: true,
                            title: '',
                            clicked: isclicked6,
                          ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 1, color: Color(0xff71809B)),
                      Row(
                        children: [
                          Expanded(
                              child: ChargerType(
                            text: '주자요금 유료',
                            imagUrl: 'img/turtle.png',
                            isimg: false,
                            title: '유료',
                            function: () {
                              if (isclicked7) {
                                setState(() {
                                  isclicked7 = false;
                                });
                              } else {
                                setState(() {
                                  isclicked7 = true;
                                });
                              }
                            },
                            clicked: isclicked7,
                          )),
                          Expanded(
                              child: ChargerType(
                            text: '주자요금 무료',
                            imagUrl: 'img/rabbit.png',
                            isimg: false,
                            title: '무료',
                            function: () {
                              if (isclicked8) {
                                setState(() {
                                  isclicked8 = false;
                                });
                              } else {
                                setState(() {
                                  isclicked8 = true;
                                });
                              }
                            },
                            clicked: isclicked8,
                          ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 1, color: Color(0xff71809B)),
                      ChargerType(
                        text: '지금 사용가능',
                        imagUrl: '',
                        isimg: false,
                        title: '지금',
                        function: () {
                          if (isclicked9) {
                            setState(() {
                              isclicked9 = false;
                            });
                          } else {
                            setState(() {
                              isclicked9 = true;
                            });
                          }
                        },
                        clicked: isclicked9,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff71809B)),
                                  onPressed: () {
                                    setState(() {
                                      isclicked1 = false;
                                      isclicked2 = false;
                                      isclicked3 = false;
                                      isclicked4 = false;
                                      isclicked5 = false;
                                      isclicked6 = false;
                                      isclicked7 = false;
                                      isclicked8 = false;
                                      isclicked9 = false;
                                    });
                                  },
                                  child: Text(
                                    '초기화',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ))),
                          SizedBox(width: 10),
                          Divider(thickness: 1, color: Color(0xff71809B)),
                          Expanded(
                              child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff0dc0ff)),
                            onPressed: () {
                              setState(() {
                                isFilter = false;

                                setState(() {
                                  isclicked10 = isclicked1;
                                  isclicked11 = isclicked2;
                                  isclicked12 = isclicked3;
                                  isclicked13 = isclicked4;
                                  isclicked14 = isclicked5;
                                  isclicked15 = isclicked6;
                                  isclicked16 = isclicked7;
                                  isclicked17 = isclicked8;
                                  isclicked18 = isclicked9;

                                  if ([
                                    isclicked1,
                                    isclicked2,
                                    isclicked3,
                                    isclicked4
                                  ].any((element) => true)) {
                                    print('checked');
                                  } else {
                                    print('not checked');
                                  }
                                  if (isclicked10) {
                                    fetchFilterData('DC콤보');
                                    datafilter = 'DC콤보';
                                    print('DC콤보');
                                    if (isclicked10 && isclicked11) {
                                      datafilter = 'DC콤보' + ' ' + 'DC차데모';
                                    }
                                  } else if (isclicked11) {
                                    fetchFilterData('DC차데모');
                                    datafilter = 'DC차데모';
                                  } else if (isclicked13) {
                                    fetchFilterData('AC3상');
                                  } else if (isclicked12) {
                                    fetchFilterData('AC완속');
                                  } else {
                                    fetchData();
                                    datafilter = '';
                                  }
                                  print(datafilter);
                                });
                              });
                            },
                            child: Text('반영하기',
                                style: TextStyle(color: Colors.white)),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )
            : Container(),
      ]),
    );
  }
}

class FilterDistance extends StatefulWidget {
  const FilterDistance({
    super.key,
    required this.text,
    required this.function,
    required this.isclicked,
    required this.distance,
  });

  final String text;
  final Function function;
  final bool isclicked;
  final Distance distance;

  @override
  State<FilterDistance> createState() => _FilterDistanceState();
}

class _FilterDistanceState extends State<FilterDistance> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
        print(distance);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: 50,
                height: 50,
                child: widget.distance == Distance.onekm
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : Container()),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.text,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xff0dc0ff)),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                fontSize: 13,
                fontFamily: "InterSemiBold",
                color: Colors.white,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}

class ButtonWidget2 extends StatelessWidget {
  const ButtonWidget2({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xff73829E)),
          onPressed: () {},
          child: Text(
            text,
            style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontFamily: "InterSemiBold",
                fontWeight: FontWeight.w600),
          )),
    );
  }
}

class ChargeStationInfoContainer extends StatelessWidget {
  const ChargeStationInfoContainer({
    super.key,
    required this.title,
    required this.value,
    required this.value_f,
  });

  final String title;
  final String value;
  final String value_f;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 90,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Color(0xff71809B),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "InterSemiBold",
              ),
            ),
            Divider(
              color: Color(0xff71809B),
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(
              height: 8,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: value,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "InterSemiBold",
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                    text: value_f,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "InterSemiBold",
                        fontSize: 13
                        // set the text color to green
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyData {
  final int inkm;
  final String address;
  final String chargefee;
  final String chargeKw;
  final int useable;
  final int usewailable;
  final String usealavailable;
  final String chargetype;
  final String chargename;
  final String companyname;

  MyData(
      {required this.inkm,
      required this.address,
      required this.chargefee,
      required this.chargeKw,
      required this.useable,
      required this.usewailable,
      required this.usealavailable,
      required this.chargetype,
      required this.chargename,
      required this.companyname});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
        inkm: json['inkm'],
        address: json['주소'],
        chargefee: json['주차료'],
        chargeKw: json['충전용량'],
        useable: json['count'],
        usewailable: json['count_available'],
        usealavailable: json['이용자 제한'],
        chargetype: json['충전타입_s'],
        chargename: json['충전소명'],
        companyname: json['운영기관명']);
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget(
      {super.key,
      required this.title,
      required this.function,
      required this.isclicked});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();

  final String title;
  final Function function;
  final bool isclicked;
}

class _DropDownWidgetState extends State<DropDownWidget> {
// initially set to "One"

  //The list of values we want on the dropdown

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
      },
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: distanceisopen == Distanceisopen.open
              ? Color(0xff71809B)
              : Color(0xff26303F),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
              color: Color(0xff71809B), style: BorderStyle.solid, width: 2),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: distanceisopen == Distanceisopen.open
                    ? Colors.white
                    : Color(0xff71809B),
                fontWeight: FontWeight.w600,
                fontFamily: "InterSemiBold",
              ),
            ),
            const Icon(Icons.arrow_drop_down)
          ],
        )),
      ),
    );
  }
}

Future<Future<Distance?>> showMyDialogerror(BuildContext context) async {
  return showDialog<Distance>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          elevation: 0.0,
          // title: Center(child: Text("Evaluation our APP")),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Color(0xff26303F),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                '범위',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  distanceisopen = Distanceisopen.close;
                                },
                                icon: Icon(Icons.close)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xff3a475c),
                    ),
                    GestureDetector(
                      onTap: () {
                        distance = Distance.onekm;
                        Navigator.of(context).pop();
                        print(distance);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff3a475c), width: 1.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  child: distance == Distance.onekm
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : Container()),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    '1km',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        distance = Distance.fivekm;
                        Navigator.of(context).pop();
                        print(distance);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff3a475c), width: 1.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  child: distance == Distance.fivekm
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : Container()),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    '5km',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        distance = Distance.tenkm;
                        Navigator.of(context).pop();
                        print(distance);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff3a475c), width: 1.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  child: distance == Distance.tenkm
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : Container()),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    '10km',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        distance = Distance.twenty;
                        Navigator.of(context).pop();
                        print(distance);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff3a475c), width: 1.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  width: 50,
                                  height: 50,
                                  child: distance == Distance.twenty
                                      ? Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : Container()),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    '20km',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    },
  );
}





// class FilterValue extends StatefulWidget {
//   const FilterValue({
//     super.key, required this.function, required this.text, required this.sdsd,
//   });

//    final Function function;
//    final String text;
//    final Distance sdsd;

//   @override
//   State<FilterValue> createState() => _FilterValueState();
// }

// class _FilterValueState extends State<FilterValue> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//        widget.function();
//       },
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Container(
//               width: 50,
//               height: 50,
//               child: widget.sdsd  == Distance.onekm ?  Icon(Icons.check, color: Colors.white,) : Container(),
//             ),
//           ),
//           Expanded(
//             child: Align(
//               alignment: Alignment.center,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 child: Text(widget.text, style: TextStyle(color: Colors.white),),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: Container(
//               height: 50,
//               width: 50,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

