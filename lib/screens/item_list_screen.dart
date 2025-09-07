import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/models/item_model.dart';
import 'package:meu_projeto_integrador/widgets/item_list_card.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  static final List<Item> items = [
    Item(
      id: 1,
      nome: 'Marea Turbo',
      preco: 10.000,
      imageUrl:
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
      descricao: 'Na compra de sua Marea Turbo e ganhe um motor novo',
    ),
    Item(
      id: 2,
      nome: 'Vectra A Turbo',
      preco: 15.000,
      imageUrl:
          'https://images.unsplash.com/photo-1542362567-b07e54358753?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
      descricao: 'Na compra de seu Vectra A Turbo e ganhe um abridor novo',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Itens'),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ItemListCard(
            item: item,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Item selecionado: ${item.nome}'),
                  backgroundColor: colorScheme.primary,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
