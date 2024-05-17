// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:elnoor_emp/core/api/api_consumer.dart';
import 'package:elnoor_emp/core/api/end_points.dart';
import 'package:elnoor_emp/core/errors/exceptions.dart';
import 'package:elnoor_emp/employee_tasks/model/tasks_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TasksController extends GetxController {
  ApiConsumer api;
  TasksController({required this.api});

  //======================================
  var dio = Dio(
    BaseOptions(
      baseUrl: EndPoint.baseUrl,
    ),
  );
  final GetStorage storage = GetStorage();
  var taskID;

  //=====================================

  Future<List<TasksModel>> fetchInPlaceTasks() async {
    try {
      var accessToken = storage.read("accessToken");
      print("the token is $accessToken");
      var response = await dio.get(
        EndPoint.listTask,
        queryParameters: {
          ApiKeys.accepted: "false",
          ApiKeys.completed: "false",
        },
        options: Options(headers: {ApiKeys.auth: "Bearer $accessToken"}),
      );
      print("the tasks response is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<TasksModel> inPlaceTasks =
          jsonResponse.map((e) => TasksModel.fromJson(e)).toList();

      List taskIds = inPlaceTasks.map((e) => e.id).toList();
      for (var task in inPlaceTasks) {
        await storage.write("taskId", task.id);
      }
      storage.write("ids", taskIds);

      return inPlaceTasks;
    } on ServerExcption catch (e) {
      print("error");
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //=========================================================================
  Future<List<TasksModel>> fetchInProgressTasks() async {
    try {
      var accessToken = storage.read("accessToken");
      print("the token is $accessToken");
      var response = await dio.get(
        EndPoint.listTask,
        queryParameters: {
          ApiKeys.accepted: "true",
          ApiKeys.completed: "false",
        },
        options: Options(headers: {ApiKeys.auth: "Bearer $accessToken"}),
      );
      print("the tasks response is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<TasksModel> inProgressTasks =
          jsonResponse.map((e) => TasksModel.fromJson(e)).toList();

      // var inProgressTaskId;
      // for (var inProgressTask in inProgressTasks) {
      //   var taskId = inProgressTask.id;
      //   // postIds.add(postId);
      //   inProgressTaskId = taskId;
      // }
      // await storage.write("inPlaceTaskId", inProgressTaskId);
      // print("the inplace id is $inProgressTaskId");
      return inProgressTasks;
    } on ServerExcption catch (e) {
      print("error");
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //========================================================
  Future<List<TasksModel>> fetchFinishedTasks() async {
    try {
      var accessToken = storage.read("accessToken");
      print("the token is $accessToken");
      var response = await dio.get(
        EndPoint.listTask,
        queryParameters: {
          ApiKeys.accepted: "true",
          ApiKeys.completed: "true",
        },
        options: Options(headers: {ApiKeys.auth: "Bearer $accessToken"}),
      );
      print("the tasks response is ${response.data}");
      List<dynamic> jsonResponse = response.data;
      List<TasksModel> finishedTasks =
          jsonResponse.map((e) => TasksModel.fromJson(e)).toList();

      // var finishedTaskId;
      // for (var finishedTask in finishedTasks) {
      //   var taskId = finishedTask.id;
      //   // postIds.add(postId);
      //   finishedTaskId = taskId;
      // }
      // await storage.write("finishedTaskId", finishedTaskId);
      // print("the inplace id is $finishedTaskId");
      return finishedTasks;
    } on ServerExcption catch (e) {
      print("error");
      throw Exception(
          'Failed to load posts: ${e.errModel.nonFieldErrors.toString()}');
    }
  }

  //==========================================================================
  switchToAcceptedTask() async {
    try {
      var accessToken = storage.read("accessToken");
      // var stoedId = storage.read("ids");
      // print("the id from one is $stoedId");
      List listId = storage.read("ids");
      for (var taskId in listId) {
        String endPoint = EndPoint.acceptTask(taskId);
        var response = await dio.post(
          endPoint,
          options: Options(headers: {
            ApiKeys.auth: "Bearer $accessToken",
          }),
        );
        print("the onetask is ${response.data}");
      }
    } on ServerExcption catch (e) {
      print("error");
      throw Exception(e.errModel.nonFieldErrors);
    }
  }

  //===========================================================================
  switchToCompletedTask() async {
    try {
      var accessToken = storage.read("accessToken");
      var stoedId = storage.read("TaskId");
      print("the id from one is $stoedId");
      var response = await dio.post(
        EndPoint.completeTask(stoedId),
        options: Options(headers: {
          ApiKeys.auth: "Bearer $accessToken",
        }),
      );
      print("the onetask is ${response.data}");
    } on ServerExcption catch (e) {
      print("error");
      throw Exception(e.errModel.nonFieldErrors);
    }
  }
}
