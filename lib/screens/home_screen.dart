// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:currency_exchange_app/result_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';
import '../currency_data.dart';
import '../selected_currency_card.dart';
import 'currency_screen.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myFocusNode =  FocusNode();
  String result = '';
  String amount = '';
  double? rate;
  String from = 'GBP';
  String to = 'USD';
  String fromCurrencyImage = 'icons/flags/png/gb.png';
  String toCurrencyImage = 'icons/flags/png/us.png';
  String? fromCurrencyPackage = 'country_icons';
  String? toCurrencyPackage = 'country_icons';

  void updateFirstCard (Currency currency) {
    setState(() {
      from = currency.tickerName;
      fromCurrencyImage = currency.flag;
      if(currency.package == null) {
        fromCurrencyPackage = null;
      } else {
        fromCurrencyPackage = currency.package;
      }
    });
  }

  void updateSecondCard (Currency currency) {
    setState(() {
      to = currency.tickerName;
      toCurrencyImage = currency.flag;
      if(currency.package == null) {
        toCurrencyPackage = null;
      } else {
        toCurrencyPackage = currency.package;
      }
    });
  }
  bool isWaiting = false;
  void getData() async {
      isWaiting = true;
      print('here');
    try {
       var data = await CurrencyData().getCurrencyData(from, to);
       isWaiting = false;
        setState(() {
          rate = data;
        });
       print('here');
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    myFocusNode.addListener((){setState((){});});
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
          style: kHeaderTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.5, vertical: 15),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Text(
                      'Exchange',
                      style: kHeaderTextStyle,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SelectedCurrencyCard(
                          onTap: () async {
                            try {
                              var currency = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CurrencyScreen(),
                                ),
                              );
                              updateFirstCard(currency);
                              getData();
                            } catch(e) {
                             print('Exception Handled');
                            }
                          },
                          currencyTicker: from,
                          currencyImage: fromCurrencyImage,
                          package: fromCurrencyPackage,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: SelectedCurrencyCard(
                          onTap: () async {
                            try {
                              var currency = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CurrencyScreen(),
                                ),
                              );
                              updateSecondCard(currency);
                              getData();
                            } catch(e) {
                              print('Exception Handled');
                            }
                          },
                          currencyTicker: to,
                          currencyImage: toCurrencyImage,
                          package: toCurrencyPackage,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    focusNode: myFocusNode,
                    cursorColor: Colors.black,
                    maxLength: 25,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    inputFormatters: [
                      ThousandsFormatter(allowFraction: true)
                    ],
                    decoration: InputDecoration(
                      contentPadding:  EdgeInsets.all(15),
                      labelText: 'Amount',
                      labelStyle: TextStyle(
                        color: myFocusNode.hasFocus? Color(0XFF495BFE): Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0XFF5D5D5D),
                            width: 3
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0XFF495BFE),
                            width: 3
                        ),
                      ),
                    ),
                    onSubmitted: (value) async{
                      setState((){
                        amount = value;
                        result = (rate! * double.parse(value)).toStringAsFixed(3);
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ResultCard(
                    rate: isWaiting?'?':rate!.toStringAsFixed(3),
                    amount: amount,
                    from: from,
                    to: to,
                    result: isWaiting?'?':result,
                  ),
                ],
              ),
            ].reversed.toList(),
          ),
        ),
      ),
    );
  }
}
