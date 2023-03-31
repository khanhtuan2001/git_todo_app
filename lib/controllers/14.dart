ar taskList = <Task>[].obs;
  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }