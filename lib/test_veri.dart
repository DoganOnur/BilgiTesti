import 'package:bilgitesti/soru.dart';

class TestVeri {
  int _soruIndex = 0; // dışarıdan alınmasını engellendi.
  List<Soru> _sorubankasi = [
    // private yapıldı
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir.', soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır.',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür.', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür.', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır.',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir.',
        soruYaniti: true),
    Soru(
        soruMetni: 'Sorular Bitti',
        soruYaniti: true),
  ];

  String getSoruMetni(){// String tipinde soru metni çekilmesi-->(int soruIndex)
    return _sorubankasi[_soruIndex].soruMetni;
  }
  bool getSoruYaniti(){ // bool tipinde soru yaniti  çekilmesi
    return _sorubankasi[_soruIndex].soruYaniti;
  }
  void sonrakiSoru(){
  }
  bool testBittimi(){
    if(_soruIndex+1>=_sorubankasi.length){
     return true;
    }else{
      return false;
    }
}

void testSifirla(){
    _soruIndex=0;
}

}
class RandomTestVeri extends TestVeri{
  @override
  int _soruIndex = 0;
  void sonrakiSoru(){
    if(_soruIndex<_sorubankasi.length-1){
      _soruIndex++;
  }
    }
}
