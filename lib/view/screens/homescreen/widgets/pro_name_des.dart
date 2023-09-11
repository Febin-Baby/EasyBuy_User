import 'package:easybuy_user_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductNameToDiscription extends StatelessWidget {
  const ProductNameToDiscription(
      {super.key,
      required this.name,
      required this.discount,
      required this.discription,
      required this.price,});
  final String name;
  final String discription;
  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
        selectHieght(khieght * 0.015),
        selectHieght(khieght * 0.015),
        Row(
          children: [
            Text(
              '$discount% OFF',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(width: kwidth * 0.08),
            Text('\$$price', style: GoogleFonts.inter(fontWeight: FontWeight.bold))
          ],
        ),
        Text(discription, style: GoogleFonts.inter(fontSize: 12), textAlign: TextAlign.justify),
        selectHieght(khieght * 0.01),
      ],
    );
  }

}
