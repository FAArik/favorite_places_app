import 'dart:io';

import 'package:favorite_places_app/models/favorite_place.dart';
import 'package:favorite_places_app/providers/favorite_places_provider.dart';
import 'package:favorite_places_app/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlaceScreen extends ConsumerStatefulWidget {
  const AddNewPlaceScreen({super.key});

  @override
  ConsumerState<AddNewPlaceScreen> createState() => _AddnewpalaceState();
}

class _AddnewpalaceState extends ConsumerState<AddNewPlaceScreen> {
  final _titleController = TextEditingController();
  File? _image;

  void _saveItem() {
    final enteredText = _titleController.text;
    if (enteredText.isEmpty || _image == null) {
      return;
    }
    ref.read(favoritePlaceProvider.notifier).addPlace(
          FavoritePlace(title: _titleController.text, image: _image!),
        );
    Navigator.of(context).pop();
  }

  void _pickImage(File file) {
    _image = file;
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
          padding: const EdgeInsets.all(12),
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
              ImageInput(
                onPickImage: _pickImage,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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