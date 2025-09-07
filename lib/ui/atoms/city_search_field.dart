import 'package:flutter/material.dart';

class CitySearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final VoidCallback onSearchPressed;

  const CitySearchField({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Nome da cidade',
        hintText: 'Ex: São Paulo, Rio de Janeiro',
        prefixIcon: const Icon(Icons.location_city),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: IconButton(
          onPressed: onSearchPressed,
          icon: const Icon(Icons.search),
        ),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
