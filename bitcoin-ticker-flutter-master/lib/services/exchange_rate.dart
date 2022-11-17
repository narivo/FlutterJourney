class ExchangeRate {
  String _time = '';
  double _rate = 0.0;
  String _assetIdBase = 'BTC';
  String _assetIdQuote = 'USD';

  ExchangeRate({
    double rate = 0.0,
    String assetIdBase = 'BTC',
    String assetIdQuote = 'USD',
  }) {
    _rate = rate;
    _assetIdBase = assetIdBase;
    _assetIdQuote = assetIdQuote;
  }

  double get rate => _rate;
}
