import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text("Kura Uygulaması"))),
        body: TextGiris(),
      ),
    );
  }
}

class TextGiris extends StatefulWidget {
  @override
  _TextGirisState createState() => _TextGirisState();
}

class _TextGirisState extends State<TextGiris> {
  TextEditingController inputcontroller = new TextEditingController();

  List isimler = [];
  String? getvalue;
  String? randomItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: inputcontroller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'İsimleri Giriniz',
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: SizedBox(
                width: 150.0,
                height: 60.0,
                child: OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      getvalue = inputcontroller.text;
                      isimler.add(getvalue!);
                      inputcontroller.clear();
                    });
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  icon: Icon(Icons.add, size: 18),
                  label: Text('Ekle', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: SizedBox(
                width: 150.0,
                height: 60.0,
                child: OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () { setState(() {
                    isimler = [];
                    randomItem = "";
                  });

                  },
                  child: Text('Temizle', style: TextStyle(fontSize: 20)),
                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 20),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: SizedBox(
              width: 150.0,
              height: 60.0,
              child: OutlinedButton(
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () { setState(() {
                  randomItem = (isimler.toList()..shuffle()).first;
                });

                },
                child: Text('Kura Çek', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        Center(child: Text(isimler.join(' - '), style: TextStyle(fontSize: 20))),
        SizedBox(height: 50),

        Center(child: Text(randomItem != null?'$randomItem':'', style: TextStyle(fontSize: 30,color: Colors.red))),
      ],
    );
  }
}
