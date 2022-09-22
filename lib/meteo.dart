import 'package:flutter/material.dart';
import 'meteoVille.dart';

class meteo extends StatefulWidget {
  @override
  State<meteo> createState() => _meteoState();
}

class _meteoState extends State<meteo> {
  String ville = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ville),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration:
                    const InputDecoration(hintText: "saisissez une ville :"),
                onChanged: (value) {
                  setState(() {
                    ville = value;
                  });
                },
              ),
            ),
          ),
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MeteoVille(ville)));
                    },
                    child: const Text(
                      'Voir ...',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    )),
              ))
        ],
      ),
    );
  }
}
