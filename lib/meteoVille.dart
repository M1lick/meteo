import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MeteoVille extends StatefulWidget {
  String ville;
  MeteoVille(this.ville);

  @override
  State<MeteoVille> createState() => _MeteoVilleState();
}

class _MeteoVilleState extends State<MeteoVille> {
  var weatherData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.ville);
  }

  getData(String city) {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=58e2d58251ea448384391ec53a32ae46&units=metric");
    http.get(url).then((res) {
      setState(() {
        this.weatherData = jsonDecode(res.body);
        print(weatherData);
      });
    }).catchError((err) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meteo ville de ${widget.ville}"),
          backgroundColor: Colors.deepOrange,
        ),
        body: (weatherData == null
            ? Center(child: CircularProgressIndicator())
            : Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/pluvieux.jpg'),
                    ),
                    Text(
                        "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['dt'] * 1000000))}",
                        style: TextStyle(fontSize: 22, color: Colors.blue)),
                    Text(
                      "${weatherData['main']['temp'].round()} °C",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
              )));
  }
}
