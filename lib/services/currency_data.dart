import 'package:http/http.dart' as http;
import 'dart:convert';
class Currency {
  Currency({ required this.name,required this.tickerName,required this.flag, this.package, required this.search});

  final String name;
  final String tickerName;
  final String flag;
  final String? package;
  final String search;
}

 List<Currency> currenciesList = [
   Currency(name: 'US Dollar', tickerName: 'USD', flag: 'icons/flags/png/us.png', package: 'country_icons', search: 'US Dollar USD'),
   Currency(name: 'Euro', tickerName: 'EUR', flag: 'icons/flags/png/eu.png', package: 'country_icons', search: 'Euro EUR'),
   Currency(name: 'British Pound', tickerName: 'GBP', flag: 'icons/flags/png/gb.png', package: 'country_icons', search: 'British Pound GBP'),
   Currency(name: 'Canadian Dollar', tickerName: 'CAD', flag: 'icons/flags/png/ca.png', package: 'country_icons', search: 'Canadian Dollar CAD'),
   Currency(name: 'Australian Dollar', tickerName: 'AUD', flag: 'icons/flags/png/au.png', package: 'country_icons', search: 'Australian Dollar AUD'),
   Currency(name: 'Mexican Peso', tickerName: 'MXN', flag: 'icons/flags/png/mx.png', package: 'country_icons', search: 'Mexican Peso MXN'),
   Currency(name: 'Japanese Yen', tickerName: 'JPY', flag: 'icons/flags/png/jp.png', package: 'country_icons', search: 'Japanese Yen JPY'),
   Currency(name: 'Hong Kong Dollar', tickerName: 'HKD', flag: 'icons/flags/png/hk.png', package: 'country_icons', search: 'Hong Kong Dollar HKD'),
   Currency(name: 'Indonesian Rupiah', tickerName: 'IDR', flag: 'icons/flags/png/ch.png', package: 'country_icons', search: 'Indonesian Rupiah IDR'),
   Currency(name: 'Israli New Shekel', tickerName: 'ILS', flag: 'icons/flags/png/cn.png', package: 'country_icons', search: 'Israli New Shekel ILS'),
   Currency(name: 'Nigerian Naira', tickerName: 'NGN', flag: 'icons/flags/png/ng.png', package: 'country_icons', search: 'Nigerian Naira NGN'),
   Currency(name: 'Norwegian Krone', tickerName: 'NOK', flag: 'icons/flags/png/no.png', package: 'country_icons', search: 'Norwegian Krone NOK'),
   Currency(name: 'New Zealand Dollar', tickerName: 'NZD', flag: 'icons/flags/png/nz.png', package: 'country_icons', search: 'New Zealand Dollar NZD'),
   Currency(name: 'Romanian Leu', tickerName: 'RON', flag: 'icons/flags/png/ro.png', package: 'country_icons', search: 'Romanian Leu RON'),
   Currency(name: 'Russian Ruble', tickerName: 'RUB', flag: 'icons/flags/png/ru.png', package: 'country_icons', search: 'Russian Rubble RUB'),
   Currency(name: 'Swedish Krona', tickerName: 'SEK', flag: 'icons/flags/png/se.png', package: 'country_icons', search: 'Swedish Krona SEK'),
   Currency(name: 'Singapore Dollar', tickerName: 'SGD', flag: 'icons/flags/png/sg.png', package: 'country_icons', search: 'Singapore Dollar SGD'),
   Currency(name: 'South African Rand', tickerName: 'ZAR', flag: 'icons/flags/png/za.png', package: 'country_icons', search: 'South African Rand ZAR'),
   Currency(name: 'Swiss Franc', tickerName: 'CHF', flag: 'icons/flags/png/ch.png', package: 'country_icons', search: 'Swiss Franc CHF'),
   Currency(name: 'South Korean Won', tickerName: 'KRW', flag: 'icons/flags/png/kr.png', package: 'country_icons', search: 'South Korean Won KRW'),
   Currency(name: 'Turkish Lira', tickerName: 'TRY', flag: 'icons/flags/png/tr.png', package: 'country_icons', search: 'Turkish Lira TRY'),
   Currency(name: 'Indian Rupee', tickerName: 'INR', flag: 'icons/flags/png/in.png', package: 'country_icons', search: 'Indian Rupee INR'),
   Currency(name: 'Brazilian Real', tickerName: 'BRL', flag: 'icons/flags/png/br.png', package: 'country_icons', search: 'Brazilian Real BRL'),
   Currency(name: 'Danish Krone', tickerName: 'DKK', flag: 'icons/flags/png/dk.png', package: 'country_icons', search: 'Danish Krone DKK'),
   Currency(name: 'Thai Baht', tickerName: 'THB', flag: 'icons/flags/png/th.png', package: 'country_icons', search: 'Thai Baht THB'),
   Currency(name: 'Malaysian Ringgit', tickerName: 'MYR', flag: 'icons/flags/png/my.png', package: 'country_icons', search: 'Malaysian Ringgit MYR'),
   Currency(name: 'Hungarian Forint', tickerName: 'HUF', flag: 'icons/flags/png/hu.png', package: 'country_icons', search: 'Hungarian Forint HUF'),
   Currency(name: 'Czech Koruna', tickerName: 'CZK', flag: 'icons/flags/png/cz.png', package: 'country_icons', search: 'Czech Koruna CZK'),
   Currency(name: 'Indoneisan Rupiah', tickerName: 'IDR', flag: 'icons/flags/png/id.png', package: 'country_icons', search: 'Indoneisan Rupiah IDR'),
   Currency(name: 'Chilean Peso', tickerName: 'CLP', flag: 'icons/flags/png/cl.png', package: 'country_icons', search: 'Chilean Peso CLP'),
   Currency(name: 'Colombian Peso', tickerName: 'COP', flag: 'icons/flags/png/co.png', package: 'country_icons', search: 'Colombian Peso COP'),
   Currency(name: 'United Arab Emirates Dirham', tickerName: 'AED', flag: 'icons/flags/png/ae.png', package: 'country_icons', search: 'United Arab Emirates AED'),
   Currency(name: 'Peruvian Sol', tickerName: 'PEN', flag: 'icons/flags/png/pe.png', package: 'country_icons', search: 'Peruvian Sol PEN'),
   Currency(name: 'Philippine Peso', tickerName: 'PHP', flag: 'icons/flags/png/ph.png', package: 'country_icons', search: 'Philippine Pesoo PHP'),
   Currency(name: 'Pakistani Rupee', tickerName: 'PRK', flag: 'icons/flags/png/pr.png', package: 'country_icons', search: 'Pakistani Rupee PRK'),
   Currency(name: 'Argentine Peso', tickerName: 'ARS', flag: 'icons/flags/png/ar.png', package: 'country_icons', search: 'Argentine Peso ARS'),
   Currency(name: 'Bahraini Dinar', tickerName: 'BHD', flag: 'icons/flags/png/bh.png', package: 'country_icons', search: 'Bahraini Dinar BHD'),
   Currency(name: 'Sri Lankan Rupee', tickerName: 'LKR', flag: 'icons/flags/png/lk.png', package: 'country_icons', search: 'Sri Lankan Rupee LKR'),
   Currency(name: 'Georgian Lari', tickerName: 'GEL', flag: 'icons/flags/png/ge.png', package: 'country_icons', search: 'Georgian Lari GEL'),
   Currency(name: 'Ukrainian Hryvnia', tickerName: 'UAH', flag: 'icons/flags/png/ua.png', package: 'country_icons', search: 'Ukrainian Hryvnia UAH'),
   Currency(name: 'Mauritian Rupee', tickerName: 'MUR', flag: 'icons/flags/png/mu.png', package: 'country_icons', search: 'Mauritian Rupee MUR'),
   Currency(name: 'Albanian Lek', tickerName: 'ALL', flag: 'icons/flags/png/al.png', package: 'country_icons', search: 'Albanian Lek ALL'),
   Currency(name: 'Bolivian Boliviano', tickerName: 'BOB', flag: 'icons/flags/png/bo.png', package: 'country_icons', search: 'Bolivian Boliviano BOB'),
   Currency(name: 'Kazakhstani Tenge', tickerName: 'KZT', flag: 'icons/flags/png/kz.png', package: 'country_icons', search: 'Kazakhsani Tenge KZT'),
   Currency(name: 'Armenian Dram', tickerName: 'AMD', flag: 'icons/flags/png/am.png', package: 'country_icons', search: 'Armenian Dram AMD'),
   Currency(name: 'Moldovan Leu', tickerName: 'MDL', flag: 'icons/flags/png/md.png', package: 'country_icons', search: 'Moldovan Leu MDL'),
   Currency(name: 'Brunei Dollar', tickerName: 'BND', flag: 'icons/flags/png/bn.png', package: 'country_icons', search: 'Brunei Dollar BND'),
   Currency(name: 'Barbadian Dollar', tickerName: 'BBD', flag: 'icons/flags/png/bb.png', package: 'country_icons', search: 'Barbadian Dollar BBD'),
   Currency(name: 'Syrian Pound', tickerName: 'SYP', flag: 'icons/flags/png/sy.png', package: 'country_icons', search: 'Syrian Pound SYP'),
   Currency(name: 'Nepalese Rupee', tickerName: 'NRP', flag: 'icons/flags/png/np.png', package: 'country_icons', search: 'Nepalese Rupee NRP'),
   Currency(name: 'Netherlands Antillean Guilder', tickerName: 'ANG', flag: 'images/ANG.png', package: null, search: 'Netherlands Antillean Guilder ANG'),
   Currency(name: 'Honduran Lempira', tickerName: 'HNL', flag: 'icons/flags/png/hn.png', package: 'country_icons', search: 'Honduran Lempira HNL'),
   Currency(name: 'Bermudan Dollar', tickerName: 'BMD', flag: 'icons/flags/png/bm.png', package: 'country_icons', search: 'Bermudan Dollar BMD'),
   Currency(name: 'Gambian Dalasi', tickerName: 'GMD', flag: 'icons/flags/png/gm.png', package: 'country_icons', search: 'Gambian Dalasi GMD'),
   Currency(name: 'Sudanese Pound', tickerName: 'SDG', flag: 'icons/flags/png/sd.png', package: 'country_icons', search: 'Sudanese Pound SDG'),
   Currency(name: 'South Sudanese Pound', tickerName: 'SSP', flag: 'icons/flags/png/ss.png', package: 'country_icons', search: 'South Sudanese Pound SSP'),
   Currency(name: 'Mongolian Tugrik', tickerName: 'MNT', flag: 'icons/flags/png/mn.png', package: 'country_icons', search: 'Mongolian Tugrik MNT'),
   Currency(name: 'Malagasy Ariary', tickerName: 'MGA', flag: 'icons/flags/png/mg.png', package: 'country_icons', search: 'Malagasy Ariary MGA'),
   Currency(name: 'Angolan Kwanza', tickerName: 'AOA', flag: 'icons/flags/png/ao.png', package: 'country_icons', search: 'Angolan Kwanza AOA'),
   Currency(name: 'Seychellois Rupee', tickerName: 'SCR', flag: 'icons/flags/png/sc.png', package: 'country_icons', search: 'Seychellois Rupee SCR'),
   Currency(name: 'Aruban Florin', tickerName: 'AWG', flag: 'icons/flags/png/aw.png', package: 'country_icons', search: 'Aruban Florin AWG'),
   Currency(name: 'Tongan Pa\'anga', tickerName: 'TOP', flag: 'icons/flags/png/to.png', package: 'country_icons', search: 'Tongan Pa\'anga TOP'),
   Currency(name: 'Eritrean Nakfa', tickerName: 'ERN', flag: 'icons/flags/png/er.png', package: 'country_icons', search: 'Eritrean Nakfa ERN'),
   Currency(name: 'Azerbaijani Manat', tickerName: 'AZN', flag: 'icons/flags/png/az.png', package: 'country_icons', search: 'Azerbaijani Manat AZN'),
   Currency(name: 'Belarusian Ruble', tickerName: 'BYN', flag: 'icons/flags/png/by.png', package: 'country_icons', search: 'Belarusian Ruble BYN'),
   Currency(name: 'Bitcoin', tickerName: 'BTC', flag: 'images/BTC.png', package: null, search: 'Bitcoin BTC'),
   Currency(name: 'Ethereum', tickerName: 'ETH', flag: 'images/ETH.png', package: null, search: 'Ethereum ETH'),
   Currency(name: 'Ripple', tickerName: 'XRP', flag: 'images/XRP.png', package: null, search: 'Ripple XRP'),
   Currency(name: 'Litecoin', tickerName: 'LTC', flag: 'images/LTC.png', package: null, search: 'Litecoin LTC'),
   Currency(name: 'Bitcoin Cash', tickerName: 'BCH', flag: 'images/Bitcoin_Cash.png', package: null, search: 'Bitcoin Cash BCH'),
   Currency(name: 'Binance Coin', tickerName: 'BNB', flag: 'images/BNB.png', package: null, search: 'Binance Coin BNB'),
   Currency(name: 'Tether', tickerName: 'USDT', flag: 'images/TETHER.png', package: null, search: 'Tether USDT'),
   Currency(name: 'Dogecoin', tickerName: 'DOGE', flag: 'images/DOGE.png', package: null, search: 'Dogecoin DOGE'),
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '544FA31F-D3C4-479A-A19D-52277151C63B';

class CurrencyData {
Future getCurrencyData (String from, String to) async{
  String requestURL =
      '$coinAPIURL/$from/$to?apikey=$apiKey';
  http.Response response = await http.get(Uri.parse(requestURL));
  if(response.statusCode == 200) {
    var data = jsonDecode(response.body)['rate'].toDouble();
    print(data);
  return  data;
  } else {
    print(response.statusCode);
    throw 'Problem with the get request';
  }
}
}




