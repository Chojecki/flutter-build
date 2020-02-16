import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: FirstScreen(),
      showPerformanceOverlay: true,
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    print('FirstScreen build');
    return Scaffold(
      appBar: AppBar(
        title: Text('First'),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0),
      body: SingleChildScrollView(
        child: WidgetTest(),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    print('SecondScreen build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 1),
      body: SingleChildScrollView(
        child: WidgetTest(),
      ),
    );
  }
}

class WidgetTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('--widget test build');

    List list = [];

    for (int i = 0; i < 20; i++) {
      if (i % 10 == 0) {
        list.add(Container(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        ));
      }

      list.add(Container(
        child: Row(
          children: <Widget>[
            RandomIcons(),
            RandomText(),
          ],
        ),
      ));
    }

    return Container(
      child: Column(
        children: <Widget>[...list],
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  final int currentIndex;

  BottomNav({this.currentIndex});

  @override
  Widget build(BuildContext context) {
    print('--bottom nav build');

    List tab = [
      FirstScreen(),
      SecondScreen(),
    ];

    return Container(
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Screen 1"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text("Screen 2"),
          ),
        ],
        onTap: (i) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => tab[i]));
        },
      ),
    );
  }
}

class RandomIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List icons = [
      Icons.ac_unit,
      Icons.access_alarm,
      Icons.access_alarms,
      Icons.access_time,
      Icons.accessible_forward,
      Icons.account_balance,
      Icons.add_alarm,
      Icons.add_circle,
      Icons.airline_seat_legroom_extra,
      Icons.add_shopping_cart,
    ];

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(icons[Random().nextInt(icons.length)]),
          Icon(icons[Random().nextInt(icons.length)]),
          Icon(icons[Random().nextInt(icons.length)]),
          Icon(icons[Random().nextInt(icons.length)]),
        ],
      ),
    );
  }
}

class RandomText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text =
        'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker';

    int start = Random().nextInt(text.length - 100);
    int end = start + Random().nextInt(100);

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Text(text.substring(start, end), overflow: TextOverflow.ellipsis),
    );
  }
}
