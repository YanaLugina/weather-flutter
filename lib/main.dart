import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'Weather',
              style: TextStyle(
                  color: Colors.black87
              ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading:
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => {},
            ),
          iconTheme: IconThemeData(color: Colors.black54),
          brightness: Brightness.light,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => {},)
            ,
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget> [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                _weatherDescription(),
                Divider(),
                _temperature(),
                Divider(),
                _temperatureForecars(),
                Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage('https://www.aziko.ru/images/NRc98b934ea89db41669301bb3e1ed14ed.jpg'),
    fit: BoxFit.cover
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget> [
      Text(
        'Пятница - Ноябрь 6',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      Divider(),
      Text(
        'In the material design language, this represents a divider. Dividers can be used in lists, Drawers, and elsewhere to separate content.',
        style: TextStyle(
          color: Colors.black54
        ),
      )
    ],
  );
}

Row _temperature() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget> [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),]),
      SizedBox(
        width: 16,
      ),
      Column(
        children: <Widget> [
          Row(
            children: <Widget> [
              Text(
                '15 * Clear',
                style: TextStyle(
                    color: Colors.deepPurple
                ),
              ),
            ],
          ),
          Row(
            children: <Widget> [
              Text(
                'Vladivostok, Primorsky',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecars() {
  return Wrap(
    spacing: 10.0,
    children:
      List.generate(3, (int index) {

        return Chip(
          label: Text(
            '${ index + 20 } *C',
            style: TextStyle(
              fontSize: 15,
            )
          ),
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
          Icons.star,
          color:Colors.yellow[600]
      ),
      Icon(
          Icons.star,
          color:Colors.yellow[600]
      ),
      Icon(
          Icons.star,
          color:Colors.yellow[600]
      ),
      Icon(
          Icons.star,
          color:Colors.grey
      ),
      Icon(
          Icons.star,
          color:Colors.grey
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget> [
      Text(
        'OpenWeatherMap.org',
        style: TextStyle(
          fontSize: 15
        ),
      ),
      stars
    ],
  );
}