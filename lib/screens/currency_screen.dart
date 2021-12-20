// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:currency_exchange_app/utilities/constants.dart';
import 'package:currency_exchange_app/services/currency_data.dart';
import 'package:currency_exchange_app/components/currency_card.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {

  TextEditingController textEditingController = TextEditingController();

  List<Currency> currencyListOnSearch = [];

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Color(0XFF495BFE),
              size: 50,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Currencies',
            style: kHeaderTextStyle,
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: Padding(
              padding: EdgeInsets.fromLTRB(25, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TextField(
                      maxLength: null,
                      controller: textEditingController,
                      onTap: () {
                        setState(() {
                          isVisible = true;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          currencyListOnSearch = currenciesList
                              .where((currency) => currency.search
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      cursorColor: Colors.black,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: kSearchTextFieldInputDecoration,
                      textInputAction: TextInputAction.none,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Visibility(
                    visible: isVisible,
                    child: TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                      ),
                      onPressed: () {
                        setState(() {
                          isVisible = false;
                          textEditingController.clear();
                          FocusScope.of(context).unfocus();
                        });
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0XFF495BFE),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: textEditingController.text.isNotEmpty &&
                currencyListOnSearch.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Not found',
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              )
            : Scrollbar(
              interactive: true,
              child: ListView.builder(
                  itemCount: textEditingController.text.isEmpty
                      ? currenciesList.length
                      : currencyListOnSearch.length,
                  itemBuilder: (context, index) => CurrencyCard(
                    currency: textEditingController.text.isEmpty
                        ? currenciesList[index]
                        : currencyListOnSearch[index],
                  ),
                ),
            ));
  }
}
