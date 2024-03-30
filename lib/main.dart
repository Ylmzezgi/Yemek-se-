import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp( BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  const BenimUygulamam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("YEMEK SEC SAYFASI",
        style: TextStyle(color: Colors.black),),

      ),
        body: YemekSayfasi(),
    )
    );
  }
}
class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}//state yardımcısıyla birlikte eğer kullanıcı state de değişiklik yaparsa bu değişikliğin nerede olduğunu kontrol edecek ve ekranı tekrar boyayacak

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo=1;
  int yemekNo=1;
  int tatliNo=1;


  void YemekleriYenile(){
    setState(() {

      yemekNo=Random().nextInt(5)+1;
      corbaNo=Random().nextInt(5)+1;
      tatliNo=Random().nextInt(5)+1;
    });
  }
  List<String> corbaAdlari=['Mercimek Çorbasi','Tarhana','Tavuksuyu','Düğün Çorbası','Yoğurtlu Çorba'];
  List <String> yemekAdlari=['Karnıyarık','Mantı','Kuru fasulye','içli köfte','ızgara'];
  List <String> tatliAdlari=['Kadayıf','Baklava','Sütlaç','Kazandibi','Dondurma'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0), //resimler arasında boşluk koydu
            child: TextButton(
                onPressed: YemekleriYenile,

                child: Image.asset("assets/corba_$corbaNo.jpg")
            ),
          )),
          Text(
            corbaAdlari[corbaNo-1],
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 300,
              child: Divider(
                  height: 5)),// alttaki resimle yazıyı ayırmak için çizgi koydu boyutlandırmak için yani bıydan boya çizgi değide resim boyutu kadar olsun istersek yerleşim ve boyutlandırma widgetına alırız
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: YemekleriYenile,
                child: Image.asset('assets/yemek_$yemekNo.jpg')),
          )
          ),
          Text(
            yemekAdlari[yemekNo-1],
            style: TextStyle(fontSize: 20),
          ),

          Container(
            width: 300,
              child: Divider(height: 5)),

          Expanded(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextButton(
                onPressed:YemekleriYenile,
                child: Image.asset('assets/tatli_$tatliNo.jpg')),
          )),
          Text(tatliAdlari[tatliNo-1])
        ],
      ),
    );
  }
}


