import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yeniproje/gonderikarti.dart';

class ProfilSayfa extends StatelessWidget {
  final String isimsoyad;
  final String kullaniciadi;
  final String kapakresim;
  final String profilres;
  final String takipci;
  final String takipedilen;
  final String paylasilan;


  const ProfilSayfa(
      {Key key,
      this.isimsoyad,
      this.kullaniciadi,
      this.kapakresim,
      this.profilres,
      this.takipci,
      this.takipedilen,
      this.paylasilan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 230.0,
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(
                          kapakresim),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 0,
                child: Hero(
                  tag: kullaniciadi,
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              profilres),
                          fit: BoxFit.cover),
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(60.0),
                      border: Border.all(width: 2.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 190.0,
                left: 145.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isimsoyad,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      kullaniciadi,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 15.0,
                top: 130.0,
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[200],
                    border: Border.all(width: 2.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_circle,
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        'takip et',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context,'döndüm');
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 75,
            color: Colors.grey.withOpacity(0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, //hem kenarla hem de birbirleir arasında eşit boşluk bırakır
              children: <Widget>[
                Sayac(
                  'TAKİPÇİ',
                  takipci
                ),
                Sayac(
                  'TAKİP EDİLEN',
                  takipedilen
                ),
                Sayac(
                  'PAYLAŞIM',
                  paylasilan
                ),
              ],
            ),
          ),
          Gonderikarti(
            profilresim:
                'https://cdn.pixabay.com/photo/2015/07/20/12/57/ambassador-852766__340.jpg',
            resimlink:
                'https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930__480.jpg',
            isimsoyad: 'jhonny bravo',
            gecensure: '10 dk önce',
            aciklama: 'Haneme hayırlı olsun :)',
          ),
        ],
      ),
    );
  }

  Column Sayac(String baslik, String sayi) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          sayi,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          baslik,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
//borderradius yuvarlama
//border çerçeve verme