// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../services/currency_data.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    Key? key,
    required this.currency,
  }) : super(key: key);

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.black12),
      ),
      onPressed: () {
        Navigator.pop(context, currency);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    currency.flag,
                    package: currency.package,
                  ),
                    ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  currency.name,
                  style: kCurrencyCardTextStyle,
                ),
              ],
            ),
            Text(
              currency.tickerName,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
