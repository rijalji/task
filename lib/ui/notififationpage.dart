import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  
  
  
   Widget notif({String text}){
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      height:100.0,
      width:100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 15.0,bottom: 10.0),
              child: Text(text, style: GoogleFonts.poppins(fontSize: 15,color: Colors.white,),
              )
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                notif(text:'Hai Rijal,Sedikit lagi kamu akan '
                    'mendapatkan Makanan Kamu,Ayo '
                    'selesaikan pembayaran kamu'),
              notif(text:'Hai Rijal,Hari ini banyak Promo Menarik,jangan sampai kehabisan,'
                  'Cek Yuk')
            ],
          ),
        ),
      ),
    );
  }
}
