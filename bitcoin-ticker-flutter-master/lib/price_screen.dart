import 'dart:async';

import 'package:bitcoin_ticker/services/exchange_rate_fetcher.dart';
import 'package:flutter/material.dart';
import 'app_util.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show HandshakeException, Platform, SocketException;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  int _pickedCurrency = 0;
  String _selectedCurrency = 'USD';
  List<double?> _rates = [for (int i = 0; i < cryptoList.length; i++) 0.0];
  List<String> _ratesString = [for (int i = 0; i < cryptoList.length; i++) '?'];

  Future getXchangeRateFor(String assetBase) async {
    var rate = await ExchangeRateFetcher(
      assetIdBase: assetBase,
      assetIdQuote: _selectedCurrency,
    ).get();

    if (rate != null) {
      return rate['rate'];
    }
  }

  Future getXchangeRate() async {
    var rate = await ExchangeRateFetcher(
      assetIdBase: 'BTC',
      assetIdQuote: _selectedCurrency,
    ).get();

    if (rate != null) {
      return rate['rate'];
    }
  }

  @override
  void initState() {
    super.initState();
    getAndShowExchangeRates();
  }

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: _selectedCurrency,
      items: getDropdownItems(),
      onChanged: (value) async {
        setState(() {
          _selectedCurrency = value!;
          for (int i = 0; i < _ratesString.length; i++) {
            _ratesString[i] = '?';
          }
        });
        getAndShowExchangeRates();
      },
    );
  }

  void getAndShowExchangeRates() async {
    try {
      for (int i = 0; i < cryptoList.length; i++) {
        _rates[i] = await getXchangeRateFor(cryptoList[i]);
      }

      setState(() {
        for (int i = 0; i < _rates.length; i++) {
          _ratesString[i] = _rates[i]?.toStringAsFixed(0) ?? '?';
        }
      });
    } on TimeoutException catch (error) {
      showSnackbar(context, 'Time out, please retry');
      print(error);
    } on HandshakeException catch (error) {
      showSnackbar(context, 'Connectivity error, please retry');
      print(error);
    } on SocketException catch (error) {
      showSnackbar(context, 'Connectivity error, please retry');
      print(error);
    } catch (error) {
      showSnackbar(context, 'Unhandled error, please retry');
      print(error);
    }
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return currenciesList.map((currency) {
      return DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
    }).toList();
  }

  CupertinoPicker iOSPicker() {
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (int value) async {
        setState(() {
          _pickedCurrency = value;
        });
      },
      children: getPickerItems(),
    );
  }

  List<Text> getPickerItems() {
    return currenciesList.map((currency) {
      return Text(currency);
    }).toList();
  }

  Widget getPicker() => /*Platform.isIOS ? iOSPicker() :*/ androidDropdown();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      '1 ${cryptoList[index]} = ${_ratesString[index]} $_selectedCurrency',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: cryptoList.length,
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
