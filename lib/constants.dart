import 'package:flutter/material.dart';
import 'package:currency_exchange_app/screens/home_screen.dart';
const  kBackgroundColor = Color(0XFFFAFAFA);

const kHeaderTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 22.5,
  fontWeight: FontWeight.bold,
);

const kResultCardShadow = BoxShadow(
  blurRadius: 5,
  color: Colors.black12,
);

const kSearchTextFieldInputDecoration = InputDecoration(
  contentPadding:  EdgeInsets.all(15),
  hintText: 'Search',
  hintStyle:  TextStyle(
      fontSize: 20
  ),
  filled: true,
  fillColor: Colors.white,
  counterText: '',
  enabledBorder: OutlineInputBorder(
      borderSide:  BorderSide(
        color: Colors.grey,
      ),
    borderRadius: BorderRadius.all(Radius.circular(15.0))
  ),
  focusedBorder: OutlineInputBorder(
      borderSide:  BorderSide(
          color: Colors.grey,
      ),
    borderRadius: BorderRadius.all(Radius.circular(15.0))
  ),
);

const kCurrencyCardTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 19,
);