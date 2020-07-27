import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:task/models/modelorder.dart';
import 'package:task/models/models.dart';
import 'package:task/ui/menupage.dart';



class Order extends StatefulWidget {
  final String namaitem;
  final String code;
  final String nameitem;
  final int harga;
  final String imgUrl;
  final int jumlah;
  final int total;
  final int ongkir;


  Order({
    this.code,
    this.harga,
    this.nameitem,
    this.imgUrl,
    this.namaitem,
    this.jumlah,
    this.total,
    this.ongkir});
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {


  String date;
  String day;
  String hour;

  void getDateAndDay(){

      date=DateFormat('dd-MM-yy','id').format(DateTime.now());
      day=DateFormat('EEEE','id').format(DateTime.now());
      hour=DateFormat('Hms','id').format(DateTime.now());
  }
  List<Menus> listt=ListOrder.listorder;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting("id", null);
    getDateAndDay();
  }


    int ongkir=6000;



  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pesanan Anda',style: GoogleFonts.poppins(fontSize: 24.0),),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.builder(
            itemCount:listt.length,
            itemBuilder: (context,i){
              final list=listt[i];
              return Container(
                margin: EdgeInsets.only(top: 5.0),
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 10.0,
                      left: 20.0,
                      child: Container(
                        width: 135.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('${list.imageUrl}')),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      left: 170.0,
                      child: Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${list.nameitem}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0)),
                          Text('Harga   : Rp.${list.harga}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0)),
                          Text('Jumlah : ${widget.jumlah}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0)),
                          Text('Rp.${list.harga*widget.jumlah}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0)),
                          Text('Ongkir  : Rp.${widget.ongkir}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0)),
                          Text('Total     : Rp.${list.harga*widget.jumlah+ongkir}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 170,
                      bottom: 5.0,
                      child: Text('Menunggu Pembayaran',style: GoogleFonts.poppins(color: Colors.redAccent[400],fontSize: 18.0)),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 5.0,
                      child: Row(
                          children: [
                            Text('$day',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0)),
                            SizedBox(
                              width: 2.6,
                            ),
                            Text('$date',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0)),
                          ]),
                    )
                  ],
                ),
              );
            },

          )
        ),
      ),
    );
  }
}
