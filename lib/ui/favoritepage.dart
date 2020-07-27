import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/models/modelcart.dart';
import 'package:task/models/modelfav.dart';
import 'package:task/snackbar/snackbar.dart';
import 'package:task/ui/detailmenupage.dart';


class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final GlobalKey<ScaffoldState> scafoldState= GlobalKey<ScaffoldState>();

  int  item=1;

  int add(){
    setState(() {
      item++;
    });
  }

  int dec(){
    if(item  <= 1){
      ListFavorite.listFav.clear();
      Snack().snackUnFav();
      return null;
    }
    setState(() {
      item--;
    });
  }

  Snack snack =Snack();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: snack.scafoldState,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child:ListFavorite.listFav.isEmpty ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Kamu belum punya ',style: GoogleFonts.poppins(fontSize: 20.0,color: Colors.grey)),
                Text('Makanan Favorit',style: GoogleFonts.poppins(fontSize: 20.0,color: Colors.grey)),
              ],
            ),
          ):Column(
            children: <Widget>[
              Expanded(
                child:GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 4,
                        crossAxisCount: 2),
                  itemCount: ListFavorite.listFav.length,
                  itemBuilder: (context,i){
                      final list=ListFavorite.listFav[i];
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return DetailMenu(nameitem: list.nameitem,imgUrl: list.imageUrl,harga: list.harga,listitem: list,);
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('${list.imageUrl}')),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(color: Colors.black54,offset: Offset(0, 01),blurRadius: 10)
                            ]
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 3,
                                right:50.0,
                                child: IconButton(icon: Icon(Icons.shopping_cart,color: Colors.pinkAccent,size: 40.0,),
                                    onPressed:(){
                                     setState(() {
                                      ListCart.cart.add(list);
                                     });
                                     snack.snackCart();
                                    }),
                              ),
                              Positioned(
                                top: 3,
                                right: 7.0,
                                child: IconButton(icon: Icon(Icons.favorite,color: Colors.pinkAccent,size: 40.0,),
                                    onPressed:(){
                                      setState(() {
                                        ListFavorite.listFav.clear();
                                      });
                                      snack.snackUnFav();
                                    }),
                              ),
                              Positioned(
                                bottom: 9,
                                left: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('${list.nameitem}',style: GoogleFonts.raleway(color: Colors.white,fontSize: 19.0,fontWeight: FontWeight.bold,),maxLines: 2,),
                                    Text('${list.harga}',style: GoogleFonts.raleway(color: Colors.white,fontSize: 19.0,fontWeight: FontWeight.bold,),maxLines: 2,)
                                  ],
                                )
                              )
                            ],
                          )
                        ),
                      );
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
