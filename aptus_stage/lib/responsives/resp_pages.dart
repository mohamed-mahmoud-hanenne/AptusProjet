import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ResponsiveQuiz extends StatelessWidget {
 final Widget mobileBody;
 final Widget DesktopBody;

 ResponsiveQuiz({required this.mobileBody, required this.DesktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth < 600){
          return mobileBody;
        }
        else{
          return DesktopBody;
        }
      }
      );
  }
}