import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrettyText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  
  const PrettyText({Key key, this.text, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.oswald(color: color, fontSize: size),);
  }
}
