import 'package:get_it/get_it.dart';
import 'package:todo_app/viewModel/todo_provider.dart';

// GetIt 인스턴스 생성 ( locator )
final GetIt getIt = GetIt.instance;

void todoProviderDiSetup(){

  /// TodoProvider 인스턴스를 싱글톤으로 등록.
  /// 싱글톤은 항상 [ 동일한 ]  인스턴스를 반환.
  getIt.registerSingleton<TodoProvider>(TodoProvider());

  /// TodoProvider 인스턴스를 팩토리로 등록.
  /// 팩토리는 요청시마다 [ 새로운 ] 인스턴스를 생성.
  // getIt.registerFactory<TodoProvider>(() => TodoProvider());
}
