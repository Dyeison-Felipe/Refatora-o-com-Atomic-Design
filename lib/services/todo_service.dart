import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meu_projeto_integrador/models/todo_model.dart';

class TodoService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/todos'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Todo.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar tarefas: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Falha ao carregar tarefas: $e');
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }

  Future createTodo(Todo todo) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/todos'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todo.toJson()),
      );

      if (response.statusCode == 201) {
        return Todo.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Falha ao criar tarefa: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Falha ao criar tarefa: $e');
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }
}
