import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Snack{

  final GlobalKey<ScaffoldState> scafoldState= GlobalKey<ScaffoldState>();
  void snackCart(){
    scafoldState.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.pinkAccent,
          content: Text('Di Tambahkan Ke Keranjang',style: GoogleFonts.poppins(fontSize: 16),),
          duration: Duration(seconds: 3),
        )
    );
  }

  void snackFav(){
    scafoldState.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.pinkAccent,
          content: Text('Di Tambahkan ke Favorit',style: GoogleFonts.poppins(fontSize: 16),),
          duration: Duration(seconds: 3),
        )
    );
  }
  void snackdeleteitem(){
    scafoldState.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.pinkAccent,
          content: Text('Menu Telah Di Hapus',style: GoogleFonts.poppins(fontSize: 16),),
          duration: Duration(seconds: 3),
        )
    );
  }

  void snackUnFav(){
    scafoldState.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.pinkAccent,
          content: Text('Favorit Berhasil Di Hapus',style: GoogleFonts.poppins(fontSize: 16),),
          duration: Duration(seconds: 3),
        )
    );
  }}