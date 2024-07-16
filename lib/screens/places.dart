import 'package:favorite_places_app/models/favorite_place.dart';
import 'package:favorite_places_app/providers/favorite_places_provider.dart';
import 'package:favorite_places_app/screens/add_new_palace.dart';
import 'package:favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});
  @override
  ConsumerState<PlacesScreen> createState() {
    return _PlacesScreen();
  }
}

class _PlacesScreen extends ConsumerState<PlacesScreen> {
  late Future<void> _placesFuture;
  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(favoritePlaceProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final favoritePlaces = ref.watch(favoritePlaceProvider);
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : PlacesList(favoritePlaces: favoritePlaces),
        ),
      ),
    );
  }
}
