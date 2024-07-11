import 'package:favorite_places_app/data/data.dart';
import 'package:favorite_places_app/models/favoritePlace.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FavoritePlaceProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<FavoritePlace>>((ref) {
  return FavoritePlacesNotifier();
});

class FavoritePlacesNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlacesNotifier() : super(MockData);

  void addPlace(FavoritePlace newPlace) {
    state = [newPlace, ...state];
  }
}
