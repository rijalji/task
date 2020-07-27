import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:task/models/modelcart.dart';
import 'package:task/models/modelfav.dart';
import 'package:task/models/models.dart';
import 'package:task/snackbar/snackbar.dart';
import 'package:task/ui/detailmenupage.dart';
import 'cartpage.dart';
import 'notififationpage.dart';
import 'searchpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Widget Category({String img,String text}){
    return Flexible(
      child: Column(
        children: [
          Container(
              height: 80.0,
              width: 60.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('$img'))
              ),
          ),
          Text('$text',style: GoogleFonts.raleway(fontSize: 18.0,fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }

  Snack snack =Snack();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:snack.scafoldState,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Container(
          margin: EdgeInsets.only(top: 3.0),
          height: 50.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Search();
              }));
            },
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                  hintText: 'Cari Barang',
                  filled: true,
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20.0)
                  )
              ),
            ),
          ),
        ),
        actions: <Widget>[
          InkWell(
            onTap: (){
            },
            child:IconButton(icon:  Icon(Icons.notifications,color: Colors.white,size: 35.0,),
                onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return NotificationPage();
              }));
                })
          ),
          SizedBox(
            width: 9.0,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
           ListTile(
            title:Text('Profile',style: GoogleFonts.poppins(fontSize: 20.0,letterSpacing: 1),),
               ),
           Divider(color: Colors.grey,height: 1,indent: 15.0,),
            ListTile(
              title:Text('Log Out',style: GoogleFonts.poppins(fontSize: 20.0),),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Container(
                height: 150.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listmenu.length,
                  itemBuilder: (context,i){
                    final list=listmenu[i];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return DetailMenu(imgUrl: list.imageUrl,nameitem:list.nameitem,harga: list.harga,listitem: list,);
                        }));
                      },
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 3.0,vertical: 3.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage('${list.imageUrl}'),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 20.0,bottom: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children:[
                                        Text('${list.nameitem}',style: GoogleFonts.raleway(color: Colors.white,fontSize: 21.0,fontWeight: FontWeight.bold,),maxLines: 2,),
                                        Text('Rp.${list.harga}',style: GoogleFonts.raleway(color: Colors.white,fontSize: 21.0,fontWeight: FontWeight.bold),maxLines: 2,),
                                      ],
                                )
                            )
                          ],
                        )
                      ),
                    );
                  },
                ),
              ),
            Container(
                margin: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Pilih Kategori',style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize: 25),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Category(img: 'assets/sale.png',text: 'Diskon'),
                        Category(img: 'assets/best.png',text: 'Terlaris'),
                        Category(img: 'assets/fav.png',text: 'Terfavorit'),
                        Category(img: 'assets/hemat.png',text: 'Hemat'),
                      ],
                    ),
                  ],
                )
            ),
          SizedBox(
            height: 4,
          ),
            Container(
              margin: EdgeInsets.only(left: 7.0),
              child: Text('Makanan',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.w400),),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: listmenu2.map((item) => InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return DetailMenu(id: item.id,imgUrl: item.imageUrl,harga: item.harga,nameitem: item.nameitem,listitem: item);
                    }));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                item.imageUrl))
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 60.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: IconButton( icon: Icon(Icons.add_shopping_cart,size: 35.0,color: Colors.pink,),
                                  onPressed: (){
                                  setState(() {
                                    ListCart.cart.add(item);
                                  });
                                  snack.snackCart();
                                  }),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton( icon: Icon(Icons.favorite_border,size: 35.0,color: Colors.pink,),
                                onPressed: (){
                              setState(() {
                                  ListFavorite.listFav.add(item);
                                  snack.snackFav();
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
                                      Text('${item.nameitem}',style: GoogleFonts.raleway(color: Colors.white,fontSize: 19.0,fontWeight: FontWeight.bold,),maxLines: 2,),
                                      Text('${item.harga}',style: GoogleFonts.raleway(color: Colors.white,fontSize: 19.0,fontWeight: FontWeight.bold,),maxLines: 2,)
                                    ]
                                )
                            ),
                          ),

                        ],
                      )
                    ),
                  ),
                )).toList()
              ),
            ),

          ],
        ),
      ),
    );
  }

}


