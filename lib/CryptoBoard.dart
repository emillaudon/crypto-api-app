import 'package:flutter/material.dart';
import 'asset_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CryptoBoard extends StatefulWidget {
  @override
  _CryptoBoardState createState() => _CryptoBoardState();
}

class _CryptoBoardState extends State<CryptoBoard> {
  double currentBTCUSDPrice = 0;
  double currentETHUSDPrice = 0;
  Color buttonColor = Colors.black;
  Map data;
  List decodedData;

  Future<String> getJsonData(String currency) async {
    String URL = 'https://api.coinpaprika.com/v1/tickers/$currency';
    if (currency == 'btc-bitcoin') {
      var response =
          await http.get(URL, headers: {'Accept': 'application/json'});
      data = json.decode(response.body);
      setState(() {
        currentBTCUSDPrice = data['quotes']['USD']['price'];
      });
    } else {
      var response =
          await http.get(URL, headers: {'Accept': 'application/json'});
      data = json.decode(response.body);
      setState(() {
        currentETHUSDPrice = data['quotes']['USD']['price'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getJsonData('btc-bitcoin');
    getJsonData('eth-ethereum');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AssetCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage('assets/bitcoin2.png'),
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              getJsonData('btc-bitcoin');
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              currentBTCUSDPrice.toStringAsPrecision(7),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 50.0),
                            ),
                            Text(
                              'USD',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black38,
                                  fontSize: 30.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AssetCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage('assets/eth.png'),
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              getJsonData('eth-ethereum');
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              currentETHUSDPrice.toStringAsPrecision(5),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  fontSize: 50.0),
                            ),
                            Text(
                              'USD',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black38,
                                  fontSize: 30.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AssetCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.refresh),
                          iconSize: 150.0,
                          color: buttonColor,
                          onPressed: () {
                            getJsonData('btc-bitcoin');
                            getJsonData('eth-ethereum');
                          },
                        ),
                        Text(
                          'UPDATE',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
