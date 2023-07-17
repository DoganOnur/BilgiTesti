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
  List<Widget> secimler = [
//kdogruIconu, kdogruIconu,kyanlisIconu,kdogruIconu, kdogruIconu,kyanlisIconu
  ];
  List<Soru> sorubankasi = [
    Soru(soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false),
    Soru(soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır', soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır', soruYaniti: true),
    Soru(soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir', soruYaniti: true),
  ];

  int soruIndex = 0;

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
                sorubankasi[soruIndex].soruMetni,
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
          // soldan sağa yazaar gibi yapa
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
                            setState(() {
                              soruIndex == 6
                                  ? soruIndex = 0
                                  : sorubankasi[soruIndex].soruYaniti == false
                                      ? secimler.add(kdogruIconu)
                                      : secimler.add(kyanlisIconu);
                              soruIndex++;
                              // secimler.add(kyanlisIconu); // bastıkca yeniden boyama yapacak
                              // ve secimler list ine ekleme yapacak
                            });
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
                            setState(() {
                              soruIndex == 6
                                  ? soruIndex = 0
                                  : sorubankasi[soruIndex].soruYaniti == true
                                      ? secimler.add(kdogruIconu)
                                      : secimler.add(kyanlisIconu);
                              soruIndex++;
                            });
                          },
                          child: Icon(Icons.thumb_up, size: 30.0),
                        ))),
              ])),
        )
      ],
    );
  }
}

class Soru {
  String soruMetni;
  bool soruYaniti;
  Soru({required this.soruMetni, required this.soruYaniti});
}
