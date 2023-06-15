 import 'package:login_screen_homework/models/question_model.dart';

class LevelModel{


  final String level;
  final int time;

  final List< QuestionModel> questions;


  LevelModel({
    required this.questions,
    required this.level,
    required this.time,
 });

 }