import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yeniproje/gonderikarti.dart';
import 'package:yeniproje/profilsayfasi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
          'SOSYALMEDYA',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext) {
                    return Column(
                      children: <Widget>[
                        duyuru('Kamil seni takip etti', ' 3 dk önce'),
                        duyuru('bir mesaj istediği', 'Şimdi'),
                        duyuru('mahmut Fotoğrafını beğendi', '1 saat önce'),
                      ],
                    );
                  });
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
              size: 32.0,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            //width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey[100], boxShadow: const [
              BoxShadow(color: Colors.black, offset: Offset(0.0, 5.0), blurRadius: 3.0),
            ]),
            height: 100.0,

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ProfilKarti('Cenk', 'https://cdn.pixabay.com/photo/2016/03/26/22/13/man-1281562__340.jpg', 'Cenk yürek', 'https://cdn.pixabay.com/photo/2021/02/08/04/04/background-5993516__340.png',
                    '20K', '500', '12'),
                ProfilKarti(
                  'Berkecan',
                  'https://cdn.pixabay.com/photo/2016/07/22/16/54/portrait-1535266__340.jpg',
                  'Berkecan Yaman',
                  'https://cdn.pixabay.com/photo/2021/01/20/11/59/banner-5934024__340.jpg',
                  '5K',
                  '400',
                  '13',
                ),
                ProfilKarti(
                  'Sultan',
                  'https://cdn.pixabay.com/photo/2015/03/03/08/55/portrait-657116__340.jpg',
                  'Sultan Ana',
                  'https://cdn.pixabay.com/photo/2019/08/13/08/09/nature-4402794__340.jpg',
                  '30K',
                  '10K',
                  '25',
                ),
                ProfilKarti(
                  'Kemal',
                  'https://cdn.pixabay.com/photo/2021/06/15/16/11/man-6339003_960_720.jpg',
                  'Kemal Dencik',
                  'https://cdn.pixabay.com/photo/2018/10/23/11/10/panorama-3767580__340.jpg',
                  '100K',
                  '1',
                  '32',
                ),
                ProfilKarti('Stephen', 'https://cdn.pixabay.com/photo/2014/08/08/20/51/hunger-413685__340.jpg', 'Stephen wick',
                    'https://cdn.pixabay.com/photo/2018/07/17/14/43/banner-3544296__480.jpg', '3K', '3', '33'),
                ProfilKarti(
                  'Angelina',
                  'https://cdn.pixabay.com/photo/2016/03/23/04/01/woman-1274056__340.jpg',
                  'Angelina Lovato',
                  'https://cdn.pixabay.com/photo/2016/08/16/03/24/forest-1597029__340.png',
                  '300M',
                  '20K',
                  '316',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Gonderikarti(
            profilresim: 'https://cdn.pixabay.com/photo/2016/11/23/00/57/adult-1851571_960_720.jpg',
            resimlink: 'https://cdn.pixabay.com/photo/2016/03/28/12/35/cat-1285634__340.png',
            isimsoyad: 'Kemal Dencik',
            gecensure: '1 saat önce',
            aciklama: 'yaramaz kedi',
          ),
          const Gonderikarti(
            profilresim: 'https://cdn.pixabay.com/photo/2015/07/20/12/57/ambassador-852766__340.jpg',
            resimlink: 'https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930__480.jpg',
            isimsoyad: 'jhonny bravo',
            gecensure: '10 dk önce',
            aciklama: 'Haneme hayırlı olsun :)',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding duyuru(String mesaj, String gecensure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            mesaj,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(gecensure),
        ],
      ),
    );
  }

  Widget ProfilKarti(String kullaniciadi, String resimler, String isimsoyad, String kapakresim, String takipci, String takipedilen, String paylasilan) {
    return Material(
      child: InkWell(
        onTap: () async {
          Future<String> donenveri = Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => ProfilSayfa(
                        profilres: resimler,
                        kullaniciadi: kullaniciadi,
                        isimsoyad: isimsoyad,
                        kapakresim: kapakresim,
                        takipci: takipci,
                        takipedilen: takipedilen,
                        paylasilan: paylasilan,
                      )));
          print(await donenveri);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                //stack children alır
                alignment: AlignmentDirectional.topStart,
                children: <Widget>[
                  Hero(
                    tag: kullaniciadi,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2.0, color: Colors.black),
                        borderRadius: BorderRadius.circular(35.0),
                        image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(resimler)),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(width: 2.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                kullaniciadi,
                style: const TextStyle(fontSize: 15.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
