import 'package:favorite_places_app/models/favoritePlace.dart';
import 'package:favorite_places_app/providers/favorite_places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlaceScreen extends ConsumerStatefulWidget {
  const AddNewPlaceScreen({super.key});

  @override
  ConsumerState<AddNewPlaceScreen> createState() => _AddnewpalaceState();
}

class _AddnewpalaceState extends ConsumerState<AddNewPlaceScreen> {
  final _titleController = TextEditingController();

  void _saveItem() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty) {
      return;
    }
    ref
        .read(FavoritePlaceProvider.notifier)
        .addPlace(FavoritePlace(title: _titleController.text));
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new place"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text("Name"),
                ),
                controller: _titleController,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text(
                      "Add Place",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
