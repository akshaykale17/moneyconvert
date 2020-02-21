import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}



class _MyAppState extends State<MyApp> {
  var _currency = ['AED','ARS','AUD','BGN','BRL','BSD','CAD','CHF','CLP','CNY','COP','CZK','DKK','DOP','EGP','EUR','FJD','GBP','GTQ','HKD','HRK','HUF','IDR','ILS','INR','ISK','JPY','KRW','KZT','MXN','MYR','NOK','NZD','PAB','PEN','PHP','PKR','PLN','PYG','RON','RUB','SAR','SEK','SGD','THB','TRY','TWD','UAH','USD','UYU','ZAR'];
  var _inputcurr = '';
  var _outcurr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Currency Converter"),
//        backgroundColor: Colors.orange,
        centerTitle: true,

      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: DropdownButton<String>(
                  items: _currency.map((String dropdownstring){
                    return DropdownMenuItem<String>(
                      child: Text(dropdownstring  ),
                      value: dropdownstring,
                    );
                  }).toList(),

                  onChanged: (String newvalue){
                    setState(() {
                      this._inputcurr=newvalue;
                      debugPrint(_inputcurr);
                    });
                  },
                ),
              ),

              Expanded(
                child: DropdownButton<String>(
                  items: _currency.map((String dropdownstring){
                    return DropdownMenuItem<String>(
                      child: Text(dropdownstring),
                      value: dropdownstring,
                    );
                  }).toList(),

                  onChanged: (String newvalue){
                    setState(() {
                      this._outcurr=newvalue;
                      debugPrint(_outcurr);
                    });
                  },
                ),
              )

            ],
          ),
          TextField(
            keyboardType: TextInputType.phone,

            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,

              hintText: "Input Amount",
              filled: true,
            ),

          )
        ],
      ),
    );
  }
}
