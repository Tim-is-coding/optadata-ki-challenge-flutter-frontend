import 'package:flutter/material.dart';


class KanbanBoardPage extends StatefulWidget {
  const KanbanBoardPage({super.key});

  @override
  KanbanBoardPageState createState() => KanbanBoardPageState();
}

class KanbanBoardPageState extends State<KanbanBoardPage> {
  List<String> todoList = ['Task 1', 'Task 2', 'Task 3'];
  List<String> inProgressList = [];
  List<String> doneList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Board'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildColumn('To Do', todoList),
          _buildColumn('In Progress', inProgressList),
          _buildColumn('Done', doneList),
        ],
      ),
    );
  }

  Widget _buildColumn(String title, List<String> items) {
    return Expanded(
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return SizedBox(
                    height: 80.0,
                    child: Draggable<String>(
                      data: item,
                      feedback: Material(
                        child: ListTile(
                          title: Text(item),
                          tileColor: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      childWhenDragging: Container(),
                      child: ListTile(
                        title: Text(item),
                      ),
                      onDragCompleted: () {
                        setState(() {
                          items.remove(item);
                          if (items == todoList) {
                            inProgressList.add(item);
                          } else if (items == inProgressList) {
                            doneList.add(item);
                          } else if (items == doneList) {
                            todoList.add(item);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            DragTarget<String>(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: 50.0,
                );
              },
              onWillAccept: (data) => true,
              onAccept: (data) {
                // Not used in this updated version
              },
            ),
          ],
        ),
      ),
    );
  }
}
