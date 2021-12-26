// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:currency_exchange_app/components/result_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../utilities/constants.dart';
import '../services/currency_data.dart';
import '../components/selected_currency_card.dart';
import 'currency_screen.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myFormat = NumberFormat();
  final textEditingController = TextEditingController();
  final myFocusNode = FocusNode();
  String? _result;
  String? amount;
  double? rate;
  String from = 'GBP';
  String to = 'USD';
  String fromCurrencyImage = 'icons/flags/png/gb.png';
  String toCurrencyImage = 'icons/flags/png/us.png';
  String? fromCurrencyPackage = 'country_icons';
  String? toCurrencyPackage = 'country_icons';

  void updateFirstCard(Currency currency) {
    setState(() {
      fromCurrencyImage = currency.flag;
      from = currency.tickerName;
      if (currency.package == null) {
        fromCurrencyPackage = null;
      } else {
        fromCurrencyPackage = currency.package;
      }
    });
  }

  void updateSecondCard(Currency currency) {
    setState(() {
      toCurrencyImage = currency.flag;
      to = currency.tickerName;
      if (currency.package == null) {
        toCurrencyPackage = null;
      } else {
        toCurrencyPackage = currency.package;
      }
    });
  }

  bool isWaiting = false;
  void getData() async {
    isWaiting = true;
    try {
      var data = await CurrencyData().getCurrencyData(from, to);
      isWaiting = false;
      setState(() {
        String inString = data.toStringAsFixed(2);
        rate = double.parse(inString);
      });
      if(textEditingController.text.isNotEmpty) {
        calculateResult(amount);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void calculateResult(var value) {
    setState(() {
      try {
        _result = (rate! * double.parse(value)).toStringAsFixed(2);
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    myFocusNode.addListener(() {
      setState(() {});
    });
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
        padding: EdgeInsets.symmetric(horizontal: 38.0, vertical: 0.0),
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
                            } catch (e) {
                              // ignore: avoid_print
                              print('Exception Handled');
                            }
                          },
                          currencyTicker: from,
                          currencyImage: fromCurrencyImage,
                          package: fromCurrencyPackage,
                        ),
                      ),
                      SizedBox(
                        width: 35,
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
                            } catch (e) {
                              // ignore: avoid_print
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
                    height: 30,
                  ),
                  TextField(
                    controller: textEditingController,
                    focusNode: myFocusNode,
                    cursorColor: Colors.black,
                    maxLength: 19,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"\d+\.?\d*"))
                    ],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      labelText: 'Amount',
                      labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Color(0XFF495BFE)
                            : Colors.grey.shade500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0XFF5D5D5D), width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0XFF495BFE), width: 3),
                      ),
                    ),
                    onSubmitted: (value)  {
                      setState(() {
                        if (textEditingController.text.isEmpty) {
                          amount = null;
                        } else {
                          final valueWithoutCommas = value.replaceAll(',', '');
                          amount = valueWithoutCommas;
                          calculateResult(amount);
                        }
                        if (rate == null) {
                          getData();
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ResultCard(
                    rate: isWaiting ? '?' : myFormat.format(rate),
                    amount: amount ?? '',
                    from: from,
                    to: to,
                    result: isWaiting || textEditingController.text.isEmpty
                        ? '?'
                        : myFormat.format(double.parse(_result!)),
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
