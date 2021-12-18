// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.amount,
    required this.from,
    required this.to,
    required this.result,
    required this.rate,
  }) : super(key: key);

  final String amount;
  final String rate;
  final String from;
  final String to;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.white),
          boxShadow: [
            kResultCardShadow,
          ]
      ),
      child: Column(
        children: [
          Text(
            '$amount $from =',
            style: TextStyle(
                fontSize: 18
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            '$result $to',
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            'Rate 1 $from = $rate $to',
            style: TextStyle(
              fontSize: 15,
              color: Color(0XFF0223FF),
            ),
          )
        ],
      ),
    );
  }
}

