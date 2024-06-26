import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'hotel.dart';

class MapView extends StatelessWidget {
  final Hotel hotel;

  MapView({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF23A0A0), 
        title: Center(
          child: Text(
            "Map View",
            style: TextStyle(
              color: Colors.black, 
              fontSize: 25,  
            ),
          ),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(hotel.latitude, hotel.longitude),  
          initialZoom: 15.0,  
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),   
         Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 80.0),  
              child: Text(
                hotel.address,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
  
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(hotel.latitude, hotel.longitude),
                child: const Icon(Icons.location_on, color: Colors.red), 
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
