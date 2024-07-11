import 'package:favorite_places_app/models/favoritePlace.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.favoritePlaces});

  final List<FavoritePlace> favoritePlaces;
  @override
  Widget build(BuildContext context) {
    if (favoritePlaces.isEmpty) {
      return Center(
        child: Text("No places added yet",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface)),
      );
    } else {
      return ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(
            favoritePlaces[index].title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ),
      );
    }
  }
}
