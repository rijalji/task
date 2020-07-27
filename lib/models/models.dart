class Menus{
  String nameitem;
  int harga;
  String imageUrl;
  int id;
  String code;
  List<Menus> listmenu;
  int item;
  String qrcode;

  Menus({this.id,this.harga,this.nameitem,this.imageUrl,this.code,this.listmenu,this.item,this.qrcode});


}

List<Menus> listmenu=[
  Menus(id:1,code: '172022',nameitem: 'Ayam Bakar',harga:15000,qrcode:'assets/ayam.png',imageUrl: 'https://selerasa.com/wp-content/uploads/2015/12/images_daging_ayam-bakar-pedas-manis.jpg' ),
  Menus(id:2,code: '179337',nameitem: 'Nasi Goreng',harga:12000,qrcode:'assets/nasigoreng.png',imageUrl: 'https://img.taste.com.au/ClP-I3I8/w720-h480-cfill-q80/taste/2016/11/nasi-goreng-82453-1.jpeg' ),
  Menus(id:3,code: '178383',nameitem: 'Coto Makassar',harga:15000,qrcode:'assets/coto.png',imageUrl: 'https://cdn2.tstatic.net/travel/foto/bank/images/coto-makassar.jpg' ),
];

List<Menus>listmenu2=[
  Menus(id:1,code: '172983',item:0,nameitem: 'Ikan Bakar Sambal',harga: 35000,qrcode:'assets/ikansambal.png',imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTfo9RBaBY7tkheOxvAXMRIsklbAlZetXr_-g&usqp=CAU'),
  Menus(id:2,code: '178737',item:0,nameitem: 'Cumi Tepung Kriuk',harga: 40000,qrcode:'assets/cumi.png',imageUrl: 'https://blog.primera52.co.id/wp-content/uploads/2016/04/cumi-cumi-goreng.png'),
  Menus(id:3,code: '170938',item:0,nameitem: 'Ikan Bakar Nila Kecap Pedas',harga: 40000,qrcode:'assets/ikanbakarnila.png',imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRS-G6GGMj7Zv1Eof-SLVLfFSOY9WtwkUjg5w&usqp=CAU'),
  Menus(id:4,code: '179383',item:0,nameitem: 'Lobster Bakar Saus Tiram',harga: 40000,qrcode:'assets/lobster.png',imageUrl: 'https://2.bp.blogspot.com/-1ORuy6lvL60/VNA6GprPy8I/AAAAAAAABNw/lThAbcJ8k20/s1600/lobsterPan.jpg'),
];

