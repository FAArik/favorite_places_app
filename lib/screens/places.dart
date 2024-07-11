import 'package:favorite_places_app/models/favoritePlace.dart';
import 'package:favorite_places_app/providers/favorite_places_provider.dart';
import 'package:favorite_places_app/screens/addNewPalace.dart';
import 'package:favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritePlaces = ref.watch(FavoritePlaceProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Favorite places app"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push<FavoritePlace>(
                  MaterialPageRoute(
                      builder: (context) => const AddNewPlaceScreen()),
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: PlacesList(favoritePlaces: favoritePlaces),
    );
  }
}
