import 'package:flutter/material.dart';
import '../atoms/city_search_field.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final VoidCallback onSearchPressed;
  final bool isLoading;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.onSearchPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CitySearchField(
          controller: controller,
          onSubmitted: onSubmitted,
          onSearchPressed: onSearchPressed,
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: isLoading ? null : onSearchPressed,
          icon: isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.cloud_download),
          label: Text(isLoading ? 'Carregando...' : 'Buscar Tempo'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
