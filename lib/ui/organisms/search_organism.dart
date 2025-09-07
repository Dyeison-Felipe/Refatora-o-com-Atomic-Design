import 'package:flutter/material.dart';
import '../molecules/search_bar.dart' as custom;

class SearchOrganism extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final VoidCallback onSearchPressed;
  final bool isLoading;

  const SearchOrganism({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.onSearchPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              Icons.search,
              size: 48,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Buscar Cidade',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            custom.SearchBar(
              controller: controller,
              onSubmitted: onSubmitted,
              onSearchPressed: onSearchPressed,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
