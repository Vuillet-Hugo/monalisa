import 'package:flutter/material.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 20, 199, 157)),
        useMaterial3: true,
      ),
      home: const Artwork(title: "Un titre qui en impose"),
    );
  }
}

class Artwork extends StatefulWidget {
  const Artwork({super.key, required this.title});
  final String title;

  @override
  State<Artwork> createState() => ArtworkState();

}

class ArtworkState extends State<Artwork> {
bool _isFavorite = false;

void _favoriteChange(){
  setState(() {
     _isFavorite = !_isFavorite;
           if (_isFavorite) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oeuvre ajoutée à vos favoris'),
          ),
        );
      }
  });
      
}

  @override
  Widget build(BuildContext context) {
     Color favoriteIconColor = _isFavorite ? Colors.red : Colors.grey;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Museum"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            Stack(fit: StackFit.passthrough, children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset('lib/images/Mona_Lisa.jpg'),
              ),
              Container(
                padding: const EdgeInsets.all(250),
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.favorite,
                  size: 100,                
                  color: _isFavorite ? Colors.red : const Color.fromARGB(55, 158, 158, 158),
                ),
              ),
            ]),
            const Text(
              'Mona Lisa la plus belle',
              style: TextStyle(
                fontSize: 30,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Léonard De Vinci le boss',
              style: TextStyle(
                fontSize: 15,
                color: Colors.brown,
              ),
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.article),
                IconButton(
                  onPressed: _favoriteChange, icon: Icon(Icons.favorite,
                  color: favoriteIconColor,
                  ),
                  ),                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
