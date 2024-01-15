

// 할 일 데이터 모델
class Todo {
  String id;
  String title;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, isCompleted: $isCompleted}';
  }
}