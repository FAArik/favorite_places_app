import 'package:favorite_places_app/data/data.dart';
import 'package:favorite_places_app/models/favorite_place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritePlaceProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<FavoritePlace>>((ref) {
  return FavoritePlacesNotifier();
});

class FavoritePlacesNotifier extends StateNotifier<List<FavoritePlace>> {
  FavoritePlacesNotifier() : super(mockData);

  void addPlace(FavoritePlace newPlace) {
    state = [newPlace, ...state];
  }
}
