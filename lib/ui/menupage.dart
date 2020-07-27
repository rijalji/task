import 'package:flutter/material.dart';
import 'package:task/ui/cartpage.dart';
import 'package:task/ui/favoritepage.dart';
import 'package:task/ui/homepage.dart';
import 'orderpage.dart';



class Menu extends StatefulWidget {
  final imgUrl;
  final jumlah;
  final harga;
  final namaitem;
  final total;
  final ongkir;
  Menu({this.ongkir,this.jumlah,this.total,this.harga,this.namaitem,this.imgUrl});
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: selectedIndex!=0,
            child: TickerMode(enabled: selectedIndex==0,
              child: Home(),),
          ),
          Offstage(
            offstage: selectedIndex!=1,
            child: TickerMode(enabled: selectedIndex==1,
              child: Order(imgUrl: widget.imgUrl,
                           namaitem: widget.namaitem,
                           harga: widget.harga,
                           total: widget.total,
                            jumlah: widget.jumlah,
                            ongkir: widget.ongkir,),),
          ),
          Offstage(
            offstage: selectedIndex!=2,
            child: TickerMode(enabled: selectedIndex==2,
              child: Cart(),
            ),
          ),
          Offstage(
            offstage: selectedIndex!=3,
            child: TickerMode(enabled: selectedIndex==3,
              child: Favorite(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child:Container(
          color: Colors.blue,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=0;
                  });
                },
                child: Icon(Icons.home,size: 40.0,color: Colors.white,),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=1;
                  });
                },
                child: Icon(Icons.description,size: 40.0,color: Colors.white,),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=2;
                  });
                },
                child: Icon(Icons.shopping_cart,size: 40.0,color: Colors.white,),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex=3;
                  });
                },
                child: Icon(Icons.favorite,size: 40.0,color: Colors.white,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
