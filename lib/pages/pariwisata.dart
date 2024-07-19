import 'package:flutter/material.dart';

class TourismPlace {
  final String name;
  final String description;
  final String image;
  double rating;

  TourismPlace({
    required this.name,
    required this.description,
    required this.image,
    this.rating = 0.0,
  });
}

class MyTourismApp extends StatelessWidget {
  final List<TourismPlace> places = [
    TourismPlace(
      name: "Borobudur Temple",
      description:
          "A 9th-century Mahayana Buddhist temple in Magelang, Central Java, Indonesia.",
      image: "borobudur.jpg",
      rating: 4.5,
    ),
    TourismPlace(
      name: "Bali",
      description:
          "An island and province of Indonesia known for its forested volcanic mountains, iconic rice paddies, beaches, and coral reefs.",
      image: "bali.jpg",
      rating: 4.8,
    ),
    TourismPlace(
      name: "Raja Ampat",
      description:
          "An archipelago comprising over 1,500 small islands, cays, and shoals surrounding the four main islands of Misool, Salawati, Batanta, and Waigeo, and the smaller island of Kofiau.",
      image: "raja_ampat.jpg",
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism App'),
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TourismDetailPage(place: places[index]),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${places[index].image}'),
                ),
                title: Text(places[index].name),
                subtitle: Text(places[index].description),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(height: 4),
                    Text('${places[index].rating}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TourismDetailPage extends StatelessWidget {
  final TourismPlace place;

  TourismDetailPage({required this.place});

  @override
  Widget build(BuildContext context) {
    int totalStars = 5;
    int filledStars = place.rating.round();

    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/${place.image}'),
            SizedBox(height: 16),
            Text(
              place.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= totalStars; i++)
                  Icon(
                    i <= filledStars ? Icons.star : Icons.star_border,
                    color: i <= 3 ? Colors.amber : Colors.grey,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
