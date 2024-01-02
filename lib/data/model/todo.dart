

// 할 일 데이터 모델
class Todo {
  String title;
  bool isCompleted;

  Todo({
    required this.title,
    this.isCompleted = false,
  });

  @override
  String toString() {
    return 'Todo{title: $title, isCompleted: $isCompleted}';
  }
}