import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'hotel.dart';
import 'hotel_service.dart';
import 'hotel_detail_screen.dart';

class HotelListScreen extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    String displayName = user?.displayName ?? 'No name';
    String email = user?.email ?? 'No email';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF23A0A0),
        title: Text(
          "List View",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,  
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        displayName,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        email,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF23A0A0),                    
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  ),
                  child: Text('Logout', style: TextStyle(color: Color(0xFFFFFFFF))),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Hotel>>(
              future: HotelService.fetchHotels(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No hotels found"));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Hotel hotel = snapshot.data![index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(hotel.image['thumbnail']!),
                          ),
                          title: Text(hotel.title),
                          subtitle: Text(hotel.address),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HotelDetailScreen(hotel: hotel),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
