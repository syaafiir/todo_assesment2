import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController todoC = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<TodoProvider>(context, listen: false).loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await PrefsService.setLogin(false);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoC,
                    decoration: const InputDecoration(
                      labelText: "Add new task",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (todoC.text.isNotEmpty) {
                      provider.addTodo(todoC.text);
                      todoC.clear();
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            Expanded(
              child: provider.todos.isEmpty
                  ? const Center(child: Text("No tasks yet"))
                  : ListView.builder(
                      itemCount: provider.todos.length,
                      itemBuilder: (context, index) {
                        final item = provider.todos[index];

                        return ListTile(
                          title: Text(item.title),
                          subtitle: Text(item.date),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => provider.deleteTodo(item.id!),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
