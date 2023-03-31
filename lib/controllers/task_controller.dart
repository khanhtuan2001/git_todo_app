import 'package:get/get.dart';
import 'package:git_todo_app/db/db_helper.dart';
import 'package:git_todo_app/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  v
ar taskList = <Task>[].obs;
  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => new Task.fromJson(data)).toList());
  }

  void delete(Task task) {
    DBHelper.delette(task);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }
}
