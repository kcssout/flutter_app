import 'package:flutter/material.dart';

class pageViewpage extends StatelessWidget{
  final List<String> images = <String>[
    'original3.png',
    'original11.png',
    'original19.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이미지 보기"),
      ),
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        itemCount: images.length,
        itemBuilder: (BuildContext context , int index){
          return Center(
            child: Image.asset('images/${images[index]}'),
          );
        },
      ),
    );
  }
  
}