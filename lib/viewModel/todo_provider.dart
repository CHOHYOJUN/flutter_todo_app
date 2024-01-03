// 할 일 목록 상태 관리를 위한 Provider 클래스
import 'package:flutter/material.dart';

import '../data/model/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> todos = [];

  // 할 일 추가
  void addTodo(String title) {
    todos.add(Todo(title: title));
    notifyListeners();
  }

  // 할 일 완료 처리
  void toggleComplete(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    notifyListeners();
  }

  // 할 일 삭제
  void removeTodo(int index) {
    todos.removeAt(index);

    toggleComplete(index);
    notifyListeners();
  }
}
