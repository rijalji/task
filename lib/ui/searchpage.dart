import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/models/modelcart.dart';
import 'package:task/models/models.dart';

import 'package:task/ui/detailmenupage.dart';




class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {


  List<Menus> listsearch=[];


  _search(String text)async{
    listsearch.clear();
    if(text.isEmpty){
      return;
    }
    listmenu2.forEach((element) {
      if(element.nameitem.toLowerCase().contains(text)||element.harga.toString().toLowerCase().contains(text))
        setState(() {
          listsearch.add(element);
        });
    });
  }

  TextEditingController searchContoller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          margin: EdgeInsets.only(top: 3.0),
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: TextField(
            controller: searchContoller,
            onChanged: _search,
            decoration: InputDecoration(
                suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: (){
                  searchContoller.clear();
                }),
                hintText: 'Cari Makanan Favoritmu',
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
            ),
          ),
        ),
      ),
      body: listsearch.length != 0 || searchContoller.text.isNotEmpty ?
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: listsearch.length,
          itemBuilder: (context,index){
            final list=listsearch[index];
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailMenu(imgUrl: list.imageUrl,nameitem: list.nameitem,harga: list.harga,);
                }));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(list.imageUrl))
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 60.0),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: IconButton( icon: Icon(Icons.shopping_cart,size: 35.0,color: Colors.pink,),
                                onPressed: (){
                                  setState(() {
                                    ListCart.cart.add(list);
                                  });
                                }),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton( icon:Icon(Icons.favorite_border,size: 35.0,color: Colors.pink,),
                              onPressed: (){
                                setState(() {

                                });
                              }),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                              margin: EdgeInsets.only(left: 20.0,bottom: 7.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('${list.nameitem}',style: GoogleFonts.raleway(color: Colors.white,fontSize: 19.0,fontWeight: FontWeight.bold,),maxLines: 2,),
                                    Text('${list.harga}',style: GoogleFonts.raleway(color: Colors.white,fontSize: 19.0,fontWeight: FontWeight.bold,),maxLines: 2,)
                                  ]
                              )
                          ),
                        ),

                      ],
                    )
                ),
              ),
            );
          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10.0),
        )
      ): Center(child: Text('Cari Makanan Favoritmu',style: GoogleFonts.raleway(color: Colors.black,fontSize: 20.0),))
    );
  }
}
