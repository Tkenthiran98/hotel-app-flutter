class Hotel {
  final int id;
  final String title;
  final String description;
  final String address;
  final String postcode;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final Map<String, String> image;

  Hotel({
    required this.id,
    required this.title,
    required this.description,
    required this.address,
    required this.postcode,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.image,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      postcode: json['postcode'],
      phoneNumber: json['phoneNumber'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      image: {
        'thumbnail': 'https://picsum.photos/200/200?random=${json['id']}',
        'large': 'https://picsum.photos/600/400?random=${json['id']}',
      },
    );
  }
}
