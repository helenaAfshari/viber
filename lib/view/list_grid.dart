

import 'package:flutter/material.dart';


class GridList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body:
         GridView.builder(
          itemCount: 21, 
          shrinkWrap: true,
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
            crossAxisCount: 3,
          ) , 
          itemBuilder:(context, index) {
            return Container(
              color: Colors.blue,
              width: 50,
              height: 100,
              child: Text("Grid"),
            );
          },),
      
          
          
      
        ));
  }


}