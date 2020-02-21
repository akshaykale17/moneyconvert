import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';



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
  final myController = TextEditingController();
  var _currency = ['AED','ARS','AUD','BGN','BRL','BSD','CAD','CHF','CLP','CNY','COP','CZK','DKK','DOP','EGP','EUR','FJD','GBP','GTQ','HKD','HRK','HUF','IDR','ILS','INR','ISK','JPY','KRW','KZT','MXN','MYR','NOK','NZD','PAB','PEN','PHP','PKR','PLN','PYG','RON','RUB','SAR','SEK','SGD','THB','TRY','TWD','UAH','USD','UYU','ZAR'];
  var _inputcurr = 'AED';
  var _outcurr = 'AED';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }


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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

                  DropdownButton<String>(

                    value: _inputcurr,
                    items: _currency.map((String dropdownstring){
                      return DropdownMenuItem<String>(
                        child: Text(dropdownstring),
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



                 DropdownButton<String>(
                   value: _outcurr,
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


            ],
          ),
          TextField(
            keyboardType: TextInputType.phone,
            controller: myController,

            decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,

              hintText: "Input Amount",
              filled: true,
            ),

          ),

          RaisedButton(
            color: Colors.blue,
            child: Text("Calculate"),
            onPressed: (){
              setState(() async {
                // Setting URL
                String url_str = "https://api.exchangerate-api.com/v4/latest/"+_inputcurr;

                var response = await http.get(
                  Uri.encodeFull(url_str),
                  headers: {"Accept":"applicaion/json"}
                );

                debugPrint(response.body);


                var data = jsonDecode(response.body);
                var fin = data['rates'];
//                print('${fin.runtimeType} : $fin');
              print(fin[_outcurr]);
              print(int.parse(myController.text));

              int b = int.parse(myController.text);
              
              print(fin[_outcurr]*b);


              });
            },
          )


        ],




      ),

    );
  }

  

}


