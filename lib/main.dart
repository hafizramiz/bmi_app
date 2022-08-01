import 'Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SecondRoute.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstRoute(),
      // Tema Belirleme
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  //Defining Variable
  //Buradaki degiskenlerin aldigi degerleri ikinci ekran gonderecegim
  int boy = 173;
  int kilo = 65;
  bool? seciliCinsiyetButonu;
  double yasSliderValue = 0;
  double kmSliderValue = 5;

  // Defining Method Return ShowDialog
  //  Burada methodun return type'i dynamic olmak zorunda. Cunku iki fakli veri tipi donduruyorum.
  //Once showDialog donduruyor onun icinde de AlertDialog donduruyor
  dynamic alertDialogFonksiyonu() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Cinsiyet Seçimi"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text("Lütfen bir cinsiyet seçimi yapın?")
                ],
              ),
            ),
            // Burasi Action yapacagi is olarak gecer
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Kapat"))
            ],
          );
        });
  }

  // Bu methodu asagida kullanacagim

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalori Hesaplama"),
        centerTitle: true,
      ),
      // Tepedeki Column
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Boy ve Kilo Rowu
          // Boy Rowu
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // //Boy Bolumu
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RotatedBox(
                          child: Text(
                            "Boy",
                            style: ktextStili,
                          ),
                          quarterTurns: -1,
                        ),
                        RotatedBox(
                          child: Text(
                            "$boy",
                            style: ktextStili,
                          ),
                          quarterTurns: -1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonTheme(
                              minWidth: 20,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    boy++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 17,
                                ),
                                splashColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 20,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    boy--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 17,
                                ),
                                splashColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Kilo Bolumu
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightBlue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RotatedBox(
                          child: Text(
                            "Kilo",
                            style: ktextStili,
                          ),
                          quarterTurns: -1,
                        ),
                        RotatedBox(
                          child: Text(
                            "$kilo",
                            style: ktextStili,
                          ),
                          quarterTurns: -1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonTheme(
                              minWidth: 20,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    kilo++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 17,
                                ),

                                splashColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 20,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    kilo--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  size: 17,
                                ),
                                splashColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Slider Rowu 1 ve 2
          // Expanded widget Column icinde kullanilirsa kendine bagli olani widgeti
          //  diger elemanlara azami yer ayirip, Column boyunca yani uzununa  genisletir.
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Kaç Yaşindaşin?",
                    style: ktextStili,
                  ),
                  Text(
                    yasSliderValue.round().toString(),
                    style: ktextStili,
                  ),
                  Slider(
                    value: yasSliderValue,
                    min: 0,
                    max: 100,
                    activeColor: Colors.red,
                    inactiveColor: Colors.blue,
                    label: "$yasSliderValue",
                    onChanged: (double inputVariable) {
                      setState(() {
                        // Burada inputVariable ile kullanicinin girdigi degeri yasSliderValue degiskenine atadi.Yani set etdi
                        // yasSliderValue degiskenini build methodun ustunde tanimladim. Ikisinin de tipi double olmak zorudadir.
                        //yasSliderValue degiskenine set etdigim degeri label da kullaniyorum.Label String tipinde veri aldigi
                        // icin onu stringe cevirmem gerekiyor. Ama once round etmem gerek.
                        yasSliderValue = inputVariable;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Haftada kaç ${kmSliderValue.round()} km yürürsün?",
                      style: ktextStili),
                  Text(
                      "Günde ortalama ${(kmSliderValue / 7).round().toString()} km yürüyorsun"),
                  Slider(
                    value: kmSliderValue,
                    onChanged: (double inputValue) {
                      setState(() {
                        kmSliderValue = inputValue;
                      });
                    },
                    label: kmSliderValue.round().toString(),
                    min: 0,
                    max: 30,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
          ),
          // Cinsiyet Rowu
          //ERKEK
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seciliCinsiyetButonu = true;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Erkek",
                            style: ktextStili,
                          ),
                          Icon(
                            Icons.male,
                            size: 50,
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: seciliCinsiyetButonu == true
                              ? Colors.red
                              : Colors.blue),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          seciliCinsiyetButonu = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Kadin", style: ktextStili),
                            Icon(Icons.female, size: 50)
                          ],
                        ),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: seciliCinsiyetButonu == false
                                ? Colors.red
                                : Colors.blue),
                      ),
                    )),
              ],
            ),
          ),
          // Hesapla Butonu
          ButtonTheme(
            splashColor: Colors.red,
            minWidth: 20,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                if (seciliCinsiyetButonu == null) {
                  alertDialogFonksiyonu();
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondRoute(
                            secondkilo: kilo,
                            secondboy: boy,
                            secondseciliCinsiyetButonu:
                            seciliCinsiyetButonu,
                            secondkmSliderValue: kmSliderValue,
                            secondyasSliderValue: yasSliderValue,
                          )));
                }
              },
              child: Text("Hesapla"),
            ),
          ),
        ],
      ),
    );
  }
}
