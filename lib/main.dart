import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));

var _currency = ['AED','ARS','AUD','BGN','BRL','BSD','CAD','CHF','CLP','CNY','COP','CZK','DKK','DOP','EGP','EUR','FJD','GBP','GTQ','HKD','HRK','HUF','IDR','ILS','INR','ISK','JPY','KRW','KZT','MXN','MYR','NOK','NZD','PAB','PEN','PHP','PKR','PLN','PYG','RON','RUB','SAR','SEK','SGD','THB','TRY','TWD','UAH','USD','UYU','ZAR'];
var _inputcurr = '';
class Home extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text("Currency Converter"),
        backgroundColor: Colors.black,
        centerTitle: true,

      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              DropdownButton<String>(
                items: _currency.map((String dropdownstring){
                  return DropdownMenuItem<String>(
                    child: Text(dropdownstring),
                  );
                }).toList(),

                onChanged: (String newvalue){
                  setState(){
                      _inputcurr = newvalue;
                  }
                },
              )
            ],
          ),
          TextField(
            keyboardType: TextInputType.phone,

            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.grey,

              hintText: "Input Amount",
              filled: true,
            ),

          )
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}


