import 'networking.dart';

const coinApiPath = 'v1/exchangerate';
final baseUri = Uri(
  scheme: 'https',
  host: 'rest.coinapi.io',
  path: coinApiPath,
);

class ExchangeRateFetcher {
  String assetIdBase = 'BTC';
  String assetIdQuote = 'USD';

  ExchangeRateFetcher({this.assetIdBase = 'BTC', this.assetIdQuote = 'USD'});

  Future get() async {
    var xchangeUri =
        baseUri.replace(path: '$coinApiPath/$assetIdBase/$assetIdQuote');

    NetworkHelper networkHelper = NetworkHelper(xchangeUri);
    return await networkHelper.getData();
  }
}
