import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/models/modelcart.dart';
import 'package:task/models/models.dart';
import 'package:task/ui/cartpage.dart';


class DetailMenu extends StatefulWidget {
  Menus listitem;
  final int id;
  final String imgUrl;
  final int harga;
  final String nameitem;

  DetailMenu({this.harga,this.nameitem,this.id,this.imgUrl,this.listitem});
  @override
  _DetailMenuState createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> with TickerProviderStateMixin {



  AnimationController _animationController;

  double _containerPaddingLeft = 20.0;
  double _animationValue;
  double _translateX = 0;
  double _translateY = 0;
  double _rotate = 0;
  double _scale = 1;

  bool show;
  bool sent = false;
  Color _color = Colors.lightBlue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    show = true;
    _animationController.addListener(() {
      setState(() {
        show = false;
        _animationValue = _animationController.value;
        if (_animationValue >= 0.2 && _animationValue < 0.4) {
          _containerPaddingLeft = 100.0;
          _color = Colors.greenAccent;
        } else if (_animationValue >= 0.4 && _animationValue <= 0.5) {
          _translateX = 80.0;
          _rotate = -20.0;
          _scale = 0.1;
        } else if (_animationValue >= 0.5 && _animationValue <= 0.8) {
          _translateY = -20.0;
        } else if (_animationValue >= 0.81) {
          _containerPaddingLeft = 20.0;
          sent = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text('Detail Menu',style: GoogleFonts.raleway(fontSize: 23.0),),
        ),
        body: Stack(
          children : [
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(3.0),
                  padding: EdgeInsets.only(bottom: 20.0),
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${widget.imgUrl}'))
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width /1 ,
                  margin: EdgeInsets.only(left: 6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      Row(
                        children: <Widget>[
                          Text('Menu :',style: GoogleFonts.poppins(color: Colors.blueAccent,fontSize: 24.0,fontWeight: FontWeight.w900,),maxLines: 2,),
                          Text(' ${widget.nameitem}',style: GoogleFonts.poppins(color: Colors.blueAccent,fontSize: 24.0,fontWeight: FontWeight.w900,),maxLines: 2,)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Harga :',style: GoogleFonts.poppins(color: Colors.blueAccent,fontSize: 24.0,fontWeight: FontWeight.w900,),maxLines: 2,),
                          Text('Rp.${widget.harga}',style: GoogleFonts.poppins(color: Colors.blueAccent,fontSize: 24.0,fontWeight: FontWeight.w900,),maxLines: 2,)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Ongkir:',style: GoogleFonts.poppins(color: Colors.blueAccent,fontSize: 24.0,fontWeight: FontWeight.w900,),maxLines: 2,),
                          Text('Rp.6.000',style: GoogleFonts.poppins(color: Colors.blueAccent,fontSize: 24.0,fontWeight: FontWeight.w900,),maxLines: 2,)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding:EdgeInsets.only(top: 530.0,bottom: 5.0),
                  child:Center(
                      child: GestureDetector(
                          onTap: () {
                            _animationController.forward();
                            setState(() {
                              ListCart.cart.add(widget.listitem);
                            });
                          },
                          child: AnimatedContainer(
                              decoration: BoxDecoration(
                                color: _color,
                                borderRadius: BorderRadius.circular(100.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: _color,
                                    blurRadius: 21,
                                    spreadRadius: -15,
                                    offset: Offset(
                                      0.0,
                                      20.0,
                                    ),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.only(
                                  left: _containerPaddingLeft,
                                  right: 20.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeOutCubic,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  (!sent)
                                      ? AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    child: Icon(Icons.send),
                                    curve: Curves.fastOutSlowIn,
                                    transform: Matrix4.translationValues(
                                        _translateX, _translateY, 0)
                                      ..rotateZ(_rotate)
                                      ..scale(_scale),
                                  )
                                      : Container(),
                                  AnimatedSize(
                                    vsync: this,
                                    duration: Duration(milliseconds: 600),
                                    child: show ? SizedBox(width: 10.0) : Container(),
                                  ),
                                  AnimatedSize(
                                    vsync: this,
                                    duration: Duration(milliseconds: 200),
                                    child: show ? Text("Tambah Ke Keranjang",style: GoogleFonts.poppins(fontSize: 15.0),) : Container(),
                                  ),
                                  AnimatedSize(
                                    vsync: this,
                                    duration: Duration(milliseconds: 200),
                                    child: sent ? Icon(Icons.done) : Container(),
                                  ),
                                  AnimatedSize(
                                    vsync: this,
                                    alignment: Alignment.topLeft,
                                    duration: Duration(milliseconds: 600),
                                    child: sent ? SizedBox(width: 10.0) : Container(),
                                  ),
                                  AnimatedSize(
                                    vsync: this,
                                    duration: Duration(milliseconds: 200),
                                    child: sent ? InkWell(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context){
                                            return Cart();
                                          }));
                                        },
                                        child: Text("Lihat Keranjang")) : Container(),
                                  ),
                                ],
                              ))))
              ),
            )
          ],
        ),
      ),
    );
  }
}
