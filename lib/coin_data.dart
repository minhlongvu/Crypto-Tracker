import 'package:bitcoin_ticker/networking.dart';

const apiKey = 'A117852E-E8C7-440C-9DFE-27743F348A2F';
const coinURL = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'BCH',
];

class CoinData {
  Future<dynamic> getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      var url = '$coinURL/$crypto/$currency?apikey=$apiKey';

      NetworkHelper networkHelper = NetworkHelper(url);

      var coinData = await networkHelper.getData();
      double coinPrice = coinData['rate'];
      cryptoPrices[crypto] = coinPrice.toStringAsFixed(2);
      //building a map of crypto and their prices
    }
    return cryptoPrices;
  }
}
