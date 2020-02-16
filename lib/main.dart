import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      home: BottomNav(),
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
      body: SingleChildScrollView(
        child: WidgetTest(),
      ),
    );
  }
}

class WidgetTest extends StatelessWidget {
  final List list = [];

  @override
  Widget build(BuildContext context) {
    print('--widget test build');

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

class BottomNav extends StatefulWidget {
  BottomNav({Key key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  final List<Widget> _tab = [
    FirstScreen(),
    SecondScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('--bottom nav build');

    return Scaffold(
      body: _tab[_currentIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
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
          onTap: onTabTapped,
        ),
      ),
    );
  }
}

class RandomIcons extends StatelessWidget {
  final List icons = [
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
  @override
  Widget build(BuildContext context) {
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

class RandomText extends StatefulWidget {
  @override
  _RandomTextState createState() => _RandomTextState();
}

class _RandomTextState extends State<RandomText> {
  final String _text =
      'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker';

  int _start;
  int _end;
  @override
  void initState() {
    super.initState();
    _start = Random().nextInt(_text.length - 100);

    _end = _start + Random().nextInt(100);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child:
          Text(_text.substring(_start, _end), overflow: TextOverflow.ellipsis),
    );
  }
}
