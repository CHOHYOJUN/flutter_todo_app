// 할 일 목록 상태 관리를 위한 Provider 클래스
import 'package:flutter/material.dart';
import '../data/model/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> todos = [];

  // Firestore 인스턴스 가져오기
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // 할 일 목록 가져오기
  Future<void> getTodos() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('todos').get();
      List<Todo> fetchedTodos = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Todo(
          id: doc.id, // 문서의 id를 Todo 객체의 id로 사용합니다.
          title: data['title'],
          isCompleted: data['isCompleted'],
        );
      }).toList();

      print('할 일 목록:');
      fetchedTodos.forEach((todo) => print(todo));

      todos = fetchedTodos;
    } catch (e) {
      print('할 일 목록을 가져오는 중 오류가 발생했습니다: $e');
    }

    notifyListeners();
  }

  // Todo 추가
  void addTodo(String title) async {
    try {
      DocumentReference docRef = await firestore.collection('todos').add({
        'title': title,
        'isCompleted': false,
      });

      Todo newTodo = Todo(
        id: docRef.id,
        title: title,
        isCompleted: false,
      );

      todos.add(newTodo);
      print('Todo가 성공적으로 추가되었습니다.');
    } catch (e) {
      print('Todo 추가 중 오류가 발생했습니다: $e');
    }
    // notifyListeners();
  }

  // Todo 삭제
  void deleteTodo(Todo todo) async {
    try {
      await firestore.collection('todos').doc(todo.id).delete();

      todos.removeWhere((item) => item.id == todo.id);

      print('Todo가 성공적으로 삭제되었습니다.');
    } catch (e) {
      print('Todo 삭제 중 오류가 발생했습니다: $e');
    }
    notifyListeners();
  }

  // Todo 수정
  void updateTodo(String todoId, Todo updatedTodo) async {
    try {
      await firestore.collection('todos').doc(todoId).update({
        'title': updatedTodo.title,
        'isCompleted': updatedTodo.isCompleted,
      });

      int index = todos.indexWhere((item) => item.id == todoId);
      if (index != -1) {
        todos[index] = updatedTodo;
      }

      print('Todo가 성공적으로 수정되었습니다.');
    } catch (e) {
      print('Todo 수정 중 오류가 발생했습니다: $e');
    }
    notifyListeners();
  }

  // Todo 검색
  void searchTodos() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('todos').get();
      List<Todo> fetchedTodos = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Todo(
          id: doc.id,
          title: data['title'],
          isCompleted: data['isCompleted'],
        );
      }).toList();

      // 받아온 할 일 목록을 출력합니다.
      print('할 일 목록:');
      fetchedTodos.forEach((todo) => print(todo));

      todos = fetchedTodos;

      notifyListeners();
    } catch (e) {
      print('할 일 검색 중 오류가 발생했습니다: $e');
    }
  }

// 할 일 완료 처리
  void toggleComplete(Todo todo) async {
    try {
      DocumentReference docRef = firestore.collection('todos').doc(todo.id);

      DocumentSnapshot snapshot = await docRef.get();
      bool isCompleted =
          (snapshot.data() as Map<String, dynamic>)['isCompleted'] ?? false;

      // 완료 상태 반전
      await docRef.update({'isCompleted': !isCompleted});

      // todos 리스트에서 해당 할 일의 완료 상태 변경
      int index = todos.indexWhere((item) => item.id == todo.id);
      if (index != -1) {
        todos[index].isCompleted = !isCompleted;
      }

      print('할 일 완료 상태가 성공적으로 변경되었습니다.');
    } catch (e) {
      print('할 일 완료 상태 변경 중 오류가 발생했습니다: $e');
    }
    notifyListeners();
  }
}
