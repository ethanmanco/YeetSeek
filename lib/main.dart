import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.deepPurple[600],
          accentColor: Colors.deepPurple[200],

          // Define the default font family.
          fontFamily: 'Open Sans',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold,
            ),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Yeet Seek'), centerTitle: true),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(35.22, -101.83), minZoom: 5.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                      "",
                  additionalOptions: {
                    'accessToken':
                    '',
                    'id': ''
                  }),
              new MarkerLayerOptions(
                  markers: setMarkers()
              ),
              new PolylineLayerOptions(
                  polylines: [
                    new Polyline(
                        points: wayPoints,
                        strokeWidth: 5.0,
                        color: Theme.of(context).primaryColor
                    )
                  ]
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Button pressed");
            },
          child: Icon(Icons.navigation),
          backgroundColor: Theme.of(context).accentColor,
    ),);

  }

  var wayPoints = <LatLng>[
    new LatLng(35.22, -101.83),
    new LatLng(35.21, -101.84),
    /*new LatLng(35.24, -101.85),
    new LatLng(35.20, -101.82),
    new LatLng(35.26, -101.81),*/
  ];

  List<Marker> pointCollection = [];

  setMarkers() {
    pointCollection.add(
        new Marker(
          width: 60.0,
          height: 60.0,
          point: new LatLng(35.215, -101.825),
          builder: (context) => new Container(
            child: IconButton(
              icon: Icon(Icons.location_on),
              color: Theme.of(context).accentColor,
              iconSize: 60.0,
              onPressed: () {
                print('Marker tapped');
              },
            ),
          )
        )
    );
    /*pointCollection.add(
        new Marker(
            width: 60.0,
            height: 60.0,
            point: new LatLng(35.22, -101.85),
            builder: (context) => new Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Theme.of(context).accentColor,
                iconSize: 60.0,
                onPressed: () {
                  print('Marker tapped');
                },
              ),
            )
        )
    );
    pointCollection.add(
        new Marker(
            width: 60.0,
            height: 60.0,
            point: new LatLng(35.23, -101.81),
            builder: (context) => new Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Theme.of(context).accentColor,
                iconSize: 60.0,
                onPressed: () {
                  print('Marker tapped');
                },
              ),
            )
        )
    );*/
    return pointCollection;
  }
}


