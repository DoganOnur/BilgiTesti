//import 'package:bilgitesti/soru.dart';--> bunu test_veri üzerinden çekmesi sağlandı.
import 'package:bilgitesti/test_veri.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

void main() {
  runApp(BilgiTest());
}

class BilgiTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  void butoncagir(bool secilenbuton) {
    if (testVeri_1.testBittimi() == true) {
      //alertdialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Tebrikler Testi Bitirdiniz!'),
            content: Text(
                'Verilen sorulara boş bırakmadan doldurdunuz.Hepsini doğru çıkması için tekrar deneyin.'
                    'Kendinizi yeniden test etmek için Başa dönün!'),
            actions: <Widget>[
              TextButton(
                child: Text('Başa Dön'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    //index sifirla
                    testVeri_1.testSifirla();
                    //secimler sifirla
                    secimler = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        // : testVeri_1.sorubankasi[soruIndex].soruYaniti == false
        //Encapsulation yapılmadığında açık kod verildi.
        testVeri_1.getSoruYaniti() == secilenbuton
            ? secimler.add(kdogruIconu)
            : secimler.add(kyanlisIconu);
        testVeri_1.sonrakiSoru();
        //soruIndex++;
        // secimler.add(kyanlisIconu); // bastıkca yeniden boyama yapacak
        // ve secimler list ine ekleme yapacak
      });
    }
  }

  List<Widget> secimler = [
//kdogruIconu, kdogruIconu,kyanlisIconu,kdogruIconu, kdogruIconu,kyanlisIconu
  ];
  TestVeri testVeri_1 = RandomTestVeri();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                // testVeri_1.sorubankasi[soruIndex].soruMetni,
                testVeri_1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          // direction: Axis.horizontal, default tur
          alignment: WrapAlignment
              .start, // sonda itibaren sol doğru artırma olur arapça gibi
          // soldan sağa yazar gibi yapar
          //alignment: WrapAlignment.center,// ortada başlar
          runSpacing: 10, // dikeyde aralarında boşluk bıraktı
          spacing: 10, // yatayda aralarında boşluk bıraktı
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            backgroundColor: Colors.red[400],
                          ),
                          onPressed: () {
                            butoncagir(false);
                            // testVeri_1.sorubankasi[soruIndex].soruYaniti == false;
                            //bozuk kod. Encapsulation yapıldı.
                          },
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            primary:
                                Colors.green[400], //background yapmakla aynıdır
                          ),
                          onPressed: () {
                            butoncagir(true);
                          },
                          child: Icon(Icons.thumb_up, size: 30.0),
                        ))),
              ])),
        )
      ],
    );
  }
}
