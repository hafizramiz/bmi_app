
import 'package:flutter/material.dart';
import 'Constants.dart';

class SecondRoute extends StatelessWidget {
  // Creating Variables
  int secondboy = 12;
  int secondkilo = 70;
  bool? secondseciliCinsiyetButonu;
  double secondyasSliderValue=10;
  double? secondkmSliderValue;

  // Creating Constructor
  SecondRoute(
      {required this.secondboy,
      required this.secondkilo,
      required this.secondseciliCinsiyetButonu,
      required this.secondkmSliderValue,
      required this.secondyasSliderValue});

  // Class icinde method tanimladim. Bu method hesaplamayi yapip sonucu dondurecek.
  // Ancak return yapabilmesi icin verilen degerin null olmamasi gerekiyor.
  // Creating method
  dynamic hesaplamafonksiyonu() {
    // Boy degiskeninin karesini al
    var bmiindex = secondkilo / (secondboy * secondboy / 10000);
    return bmiindex.round();
  } // Simdi bu methodu asagida kullanacagim

  // Creating method 2
  //Burada bir method tanimladim. Bu methodun dondurdugu seyi asagida kullanacagim
  // Methodumun return type'ni null olarak degistirdim.
  // Ancak bunu widget agacina

  Text durumfonksiyonu() {
    if (hesaplamafonksiyonu() <= 19) {
      return Text(
        "Çok zayifsiniz bir az kilo almanizda fayda var",
        style: ktextStili,
      );
    }else if (25 >= hesaplamafonksiyonu() && hesaplamafonksiyonu() > 19) {
      return Text(
        "Normal vücüt ağirliğina sahipsiniz. Tebrikler",
        style: ktextStili,
      );
    } else if (hesaplamafonksiyonu() > 25 && hesaplamafonksiyonu() < 30) {
      return Text(
        "Kilonuz fazla spor yapmalisiniz",
        style: ktextStili,
      );
    } else {
      return Text(
        "Aşiri Şişmansin. Bir diyetisyen eşliginde kilo vermelisin",
        style: ktextStili,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Sonuç Sayfasi"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
              heightFactor: 3.2,
              child: Text(
                "SONUÇ",
                style: TextStyle(fontSize: 50),
              )),
          Container(
            margin: EdgeInsets.only(right: 10, left: 10, bottom: 80),
            height: MediaQuery.of(context).size.width*0.5,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                // Burada Ternary operator kullanacagim
                Text(
                    hesaplamafonksiyonu() <= 19
                        ? "ZAYIF"
                        : hesaplamafonksiyonu() > 19 &&
                                hesaplamafonksiyonu() <= 25
                            ? "NORMAL"
                            : hesaplamafonksiyonu() > 25 &&
                                    hesaplamafonksiyonu() <= 30
                                ? "FAZLA KİLOLU"
                                : "AŞIRI ŞIŞMAN",
                    style: TextStyle(
                        color: hesaplamafonksiyonu() >= 30
                            ? Colors.red
                            : Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                Text(
                  "Vücut Kitle İndeksiniz ",
                  style: ktextStili,
                ),
                Text("${hesaplamafonksiyonu()}",
                    style: TextStyle(fontSize: 60)),
                durumfonksiyonu(),
              ],
            ),
          ),
          ButtonTheme(
            minWidth: 300,
            height: 40,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Tekrar Hesapla"),
            ),
          ),
        ],
      ),
    );
  }
}
