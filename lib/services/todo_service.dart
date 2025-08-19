import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meu_projeto_integrador/model/todo_model.dart';

class TodoService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  // Método para buscar a lista de tarefas
  Future<List<Todo>> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/todos'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((todo) => Todo.fromJson(todo)).toList();
      } else {
        throw Exception('Falha ao carregar tarefas: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      throw Exception('Erro ao carregar tarefas: $e');
    } catch (e) {
      throw Exception('Erro desconhecido: $e');
    }
  }

  // Método para adicionar uma nova tarefa
  
  Future<Todo> createTodo(Todo todo) async {
    try{
      final response = await http.post(
        Uri.parse('$_baseUrl/todos'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode(todo.toJson()),
      );

      if (response.statusCode == 201) {
        return Todo.fromJson(json.decode(response.body));
      } else {
        throw Exception('Falha ao criar a tarefa: ${response.statusCode}');
      }
    }
    on http.ClientException catch (e) {
      throw Exception('Erro ao criar tarefa: $e');
    } catch (e) {
      throw Exception('Erro desconhecido: $e');
    }
  }
}
