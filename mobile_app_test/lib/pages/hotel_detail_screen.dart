import 'package:flutter/material.dart';
import 'hotel.dart';
import 'map_view.dart';

class HotelDetailScreen extends StatelessWidget {
  final Hotel hotel;

  HotelDetailScreen({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF23A0A0),  
        title: Center(
          child: Text(
            "Details",
            style: TextStyle(
              color: Colors.black,  
              fontSize: 24,  
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on, color: Colors.black), 
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapView(hotel: hotel),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            hotel.image['large']!,
            errorBuilder: (context, error, stackTrace) {
              return Center(child: Text('Image not available'));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  hotel.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
