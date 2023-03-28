import 'package:flutter/material.dart';

class Gonderikarti extends StatelessWidget {
  final String profilresim;
  final String isimsoyad;
  final String gecensure;
  final String resimlink;
  final String aciklama;

  const Gonderikarti({Key key, this.profilresim, this.isimsoyad, this.gecensure, this.resimlink, this.aciklama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: double.infinity,
          height: 388.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo,
                          image: DecorationImage(image: NetworkImage(profilresim), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isimsoyad,
                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          Text(
                            gecensure,
                            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                aciklama,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.network(
                resimlink,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Iconlubutonum(
                      iconum: Icons.favorite,
                      yazi: 'beğen',
                      fonksiyonum: () {
                        print('beğene basıldı');
                      }),
                  Iconlubutonum(
                    iconum: Icons.comment,
                    yazi: 'yorum',
                    fonksiyonum: () {
                      print('yorum yapa basıldı');
                    },
                  ),
                  // FlatButton.icon(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.share,
                  //       color: Colors.grey,
                  //     ),
                  //     label: Text(
                  //       'Paylaş',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.grey,
                  //       ),
                  //     ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Iconlubutonum extends StatelessWidget {
  final IconData iconum;
  final String yazi;
  final fonksiyonum;
  Iconlubutonum({this.iconum, this.yazi, this.fonksiyonum});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: fonksiyonum,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(
                iconum,
                color: Colors.grey,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                yazi,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
