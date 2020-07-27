import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/snackbar/snackbar.dart';
import 'package:task/ui/cashpage.dart';
import 'package:task/models/modelcart.dart';
import 'package:task/models/modelorder.dart';

class Cart extends StatefulWidget {

  final nameitem;

  Cart({this.nameitem});
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

    int  item=1;
    int total=0;
    int ongkir=6000;
    int result=0;

  int add(){
    setState(() {
      item++;
    });
  }

  Snack snack =Snack();

  int dec(){
    if(item  <= 1){
      ListCart.cart.clear();
      snack.snackdeleteitem();
      return null;
    }
    setState(() {
      item--;
    });
  }

    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: snack.scafoldState,
        body:Container(
          child:ListCart.cart.isEmpty ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text('Oppss',style: GoogleFonts.poppins(fontSize: 20.0,color: Colors.grey)),
              Text('Keranjang Kamu Kosong',style: GoogleFonts.poppins(fontSize: 20.0,color: Colors.grey)),
              ],
            ),
          ): ListView.builder(
            itemCount: ListCart.cart.length,
            itemBuilder: (context,i){
              final list=ListCart.cart[i];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 7.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(color: Colors.black,offset: Offset(0, 3),blurRadius: 7.0)
                    ]
                  ),
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20.0),
                              height: 160,
                              width: 170.0,
                              child:Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('${list.imageUrl}')),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2.4,
                            margin: EdgeInsets.only(bottom: 10.0,top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('${list.nameitem}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0),maxLines: 1,),
                                Text('Rp.${(list.harga*item)}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0),maxLines: 1,),
                                Text('Ongkir :Rp.$ongkir',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0),maxLines: 1,),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Total    :Rp.${(list.harga*item)+ongkir}',style: GoogleFonts.poppins(color: Colors.white,fontSize: 18.0),),
                                Row(
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          dec();
                                        });
                                      },
                                      child: Text('-',style: GoogleFonts.poppins(color: Colors.white,fontSize: 30.0),),
                                    ),
                                   SizedBox(
                                     width: 20.0,
                                   ),
                                   Text('$item',style: GoogleFonts.poppins(color: Colors.white,fontSize: 20.0),),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                   GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         add();
                                       });
                                     },
                                     child: Text('+',style: GoogleFonts.poppins(color: Colors.white,fontSize: 30.0),),
                                   ),
                                  ],
                                ),
                                Container(
                                  width: 100.0,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        ListCart.cart.clear();
                                        ListOrder.listorder.add(list);
                                       Navigator.push(context, MaterialPageRoute(builder: (context){
                                         return Cash(
                                           code: list.code,
                                           qrcode: list.qrcode,
                                           jumlah: item,
                                           total: total,
                                           harga: list.harga,
                                           ongkir: ongkir,);
                                       }));
                                      },
                                      child: Center(child: Text('Pesan',style: GoogleFonts.poppins(color: Colors.white,fontSize: 15.0),))),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
     )
      )
    );
  }
}


//  Container(
//  height: 170.0,
//  width: 350.0,
//  decoration: BoxDecoration(
//  color: Colors.blue,
//  borderRadius: BorderRadius.circular(20),
//  boxShadow:[
//  BoxShadow(color: Colors.black54)
//  ]
//  ),
//  child:Stack(
//  children: <Widget>[
//  Container(
//  margin: EdgeInsets.only(top: 25.0),
//  child: Column(
//  crossAxisAlignment: CrossAxisAlignment.start,
//  children: <Widget>[
//  Row(
//  children: <Widget>[
//  ClipRRect(
//  borderRadius: BorderRadius.circular(20.0),
//  child: Container(
//  margin: EdgeInsets.only(left: 30.0),
//  height: 100,
//  width: 100,
//  child: Image(
//  fit: BoxFit.cover,
//  image: NetworkImage('')),
//  ),
//  ),
//  SizedBox(
//  width: 10,
//  ),
//  Container(
//  margin: EdgeInsets.only(bottom: 60.0),
//  child: Column(
//  mainAxisAlignment: MainAxisAlignment.start,
//  crossAxisAlignment: CrossAxisAlignment.start,
//  children: <Widget>[
//  Text('',style: GoogleFonts.raleway(color: Colors.white,fontSize: 23),),
//  Text('',style: GoogleFonts.raleway(color: Colors.white,fontSize: 20),),
//  ],
//  ),
//  ),
//  ],
//  ),
//  ],
//  ),
//  ),
//  Container(
//  margin: EdgeInsets.only(left: 230.0),
//  child: Align(
//  alignment: Alignment.bottomCenter,
//  child: Row(
//  children: <Widget>[
//  Text('Edit',style: GoogleFonts.raleway(color: Colors.amber,fontSize: 20.0,fontWeight: FontWeight.w600)),
//  SizedBox(
//  width: 20.0,
//  ),
//  GestureDetector(
//  onTap: (){
//  setState(() {
//
//  });
//  },
//  child: Container(
//  margin: EdgeInsets.only(bottom: 6.0),
//  child: Text('-',style: GoogleFonts.raleway(color: Colors.white,fontSize: 43.0))),
//  ),
//  SizedBox(
//  width: 10.0,
//  ),
//  Container(
//  margin: EdgeInsets.only(bottom: 4.0),
//  child: Text('',style:  GoogleFonts.raleway(color: Colors.white,fontSize: 24.0))),
//  SizedBox(
//  width: 10.0,
//  ),
//  GestureDetector(
//  onTap: (){
//  setState(() {
//
//  });
//  },
//  child: Text('+',style: GoogleFonts.raleway(color: Colors.white,fontSize: 43.0)),
//  )
//  ],
//  ),
//  ),
//  ),
//  ],
//  )
//  );
//},
//),
//),
//),