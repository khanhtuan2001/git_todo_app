import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:git_todo_app/controllers/task_controller.dart';
import 'package:git_todo_app/services/notification_services.dart';
import 'package:git_todo_app/services/theme_services.dart';
import 'package:git_todo_app/services/vd.dart';
import 'package:git_todo_app/ui/add_task_bar.dart';
import 'package:git_todo_app/ui/theme.dart';
import 'package:git_todo_app/ui/widget/button.dart';
import 'package:git_todo_app/ui/widget/task_tile.dart';

import '../models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  // ignore: prefer_typing_uninitialized_variables
  var notifyHelper;
  @override
  void initSate() {
    super.initState();
    notifyHelper.initializeNotification();
    notifyHelper = NotifyHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
    );
  }