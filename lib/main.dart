import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Set<Marker> _marcadores = {};
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(-5.088746205010684, -42.81118370638477);


  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _carregarMarcadores();
  }

  _carregarMarcadores() {
    Set<Marker> marcadoresLocal = {};
    Marker marcadoIfpi = Marker(
      markerId: MarkerId('IFPI'),
      position: LatLng(-5.088544046019581, -42.81123803149089),
    );
    Marker marcadoIfpiSul = Marker(
      markerId: MarkerId('IFPI-SUL'),
      position: LatLng(-5.101723, -42.813114),
    );
    marcadoresLocal.add(marcadoIfpi);
    marcadoresLocal.add(marcadoIfpiSul);
  
    setState(() {
      _marcadores = marcadoresLocal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom:17.0),
        markers: _marcadores,
      ),
    );
  }
}
