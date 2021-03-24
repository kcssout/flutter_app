import 'package:flutter/material.dart';

class ImageListPage extends StatelessWidget {
  final List<String> images = <String>[
    'original3.png',
    'original11.png',
    'original19.png'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("이미지 리스트"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text("${images[index]}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageViewPage(
                          path: 'images/${images[index]}')),
                );
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

class ImageViewPage extends StatelessWidget {
  ImageViewPage({Key key, this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 보기'),
      ),
      body: Center(
        child: Image.asset(path),
      ),
    );
  }
}
