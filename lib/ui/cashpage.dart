import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/ui/cartpage.dart';
import 'package:task/ui/orderpage.dart';

import 'package:task/ui/menupage.dart';

class Cash extends StatefulWidget {

  final String code;
  final String qrcode;
  final int jumlah;
  final int total;
  final int harga;
  final String nameitem;
  final int ongkir;
  final String imgUrl;

  Cash({
    this.imgUrl,
    this.code,
    this.qrcode,
    this.jumlah,
    this.total,
    this.harga,
    this.nameitem,
    this.ongkir});
  @override
  _CashState createState() => _CashState();
}

class _CashState extends State<Cash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 250.0,
                width: 250.0,
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('${widget.qrcode}'))
                 ),
              ),
             Column(
               children: <Widget>[
                 Text('Kode Pesanan Anda',style: GoogleFonts.raleway(fontSize: 22.0),),
                 Text('${widget.code}',style: GoogleFonts.poppins(fontSize: 22.0,fontWeight: FontWeight.bold)),
               ],
             ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Silahkan Selesaikan Pembayaran Anda',style: GoogleFonts.raleway(fontSize: 18.0),),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Menu(
                            imgUrl: widget.imgUrl,
                            jumlah: widget.jumlah,
                            harga:widget.harga,
                            namaitem: widget.nameitem,
                            total: widget.total,
                            ongkir: widget.ongkir,
                          );
                        }));

                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue
                          ),
                          child: Text('Kembali Ke Home',style: GoogleFonts.poppins(fontSize: 15.0,color: Colors.white)))),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
