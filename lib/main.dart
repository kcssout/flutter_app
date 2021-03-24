import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/page/page1.dart';
import 'package:flutter_app/page/page2.dart';
import 'package:flutter_app/page/ImageListPage.dart';
import 'package:flutter_app/page/pageViewpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
//      home: RandomWords(),

      initialRoute: '/',
      routes: {
        //라우트설정
        '/': (context) => RandomWords(),
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/image3': (context) => ImageListPage(),
        '/image4': (context) => pageViewpage(),
      },
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>(); // NEW

  final _biggerFont = TextStyle(fontSize: 18.0);

//  @override
//  Widget build(BuildContext context) {
//    final wordPair = WordPair.random();
//    return Text(wordPair.asPascalCase);
//  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(5));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair); // NEW

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //Main
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              //현사용자
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/original3.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                //비사용자
                CircleAvatar(
                  backgroundImage: AssetImage('images/original11.png'),
                  backgroundColor: Colors.white,
                )
              ],
              accountName: Text('hyuntae'),
              accountEmail: Text('hyuntae@gmail.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0))),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('홈'),
              onTap: () {
                print('home pressed');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.image,
                color: Colors.grey[850],
              ),
              title: Text('사진보기'),
              onTap: () {
                Navigator.pushNamed(context, '/page1');
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(
                Icons.border_color,
                color: Colors.grey[850],
              ),
              title: Text('글쓰기'),
              onTap: () {
                Navigator.pushNamed(context, '/page2');
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(
                Icons.add_photo_alternate,
                color: Colors.grey[850],
              ),
              title: Text('이미지 리스트'),
              onTap: () {
                Navigator.pushNamed(context, '/image3');
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(
                Icons.image,
                color: Colors.grey[850],
              ),
              title: Text('이미지 뷰어'),
              onTap: () {
                Navigator.pushNamed(context, '/image4');
              },
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles = _saved.map(
        (WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('saved suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }
}

class PageView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
    );
  }
}

class PageView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
    );
  }
}
