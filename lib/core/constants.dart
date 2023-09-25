import 'package:flutter/material.dart';

final TextStyle kboldText = TextStyle(
  color: Colors.white.withOpacity(0.5),
  fontWeight: FontWeight.w700,
  fontSize: 12,
);
class Boldtext extends StatelessWidget {
  const Boldtext({super.key ,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora',),);
  }
}

class Boldtext18 extends StatelessWidget {
  const Boldtext18({super.key ,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800,fontFamily: 'Lora',),);
  }
}
late double khieght;
late double kwidth;

selectHieght(double? height) {
  return SizedBox(
    height: height,
  );
}

const String embtyLottie ='assets/lottie/animation_lmyr4fc2.json';