import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';

import '../home_screen.dart';
import '../level_screen.dart';

class About_Quiz extends StatelessWidget {
  const About_Quiz({super.key,});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.C_030651,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const LevelScreen();
                        }),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: height*(5/812)),
                      child:  const Icon(Icons.arrow_back_ios,color: AppColors.white,),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: const [
                    Column(
                      children: [
                        SizedBox(
                          height: 36,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 40,
                            width: 327,
                            child: Text(
                              "Quiz?",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white
                              ),
                            ),
                          ),
                        ),
                        Text("""A quiz is a form of game or mind sport in which players attempt to answer questions correctly on one or several specific topics. Quizzes can be used as a brief assessment in education and similar fields to measure growth in knowledge, abilities, and skills, or simply as a hobby. They can also be televised for entertainment purposes, often in a game show format.
                        """,style: TextStyle(color: AppColors.white),),
                        SizedBox(
                          height: 24,
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.white,
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 40,
                            width: 327,
                            child: Text(
                              "Easy Level:",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color:AppColors.white
                              ),
                            ),
                          ),
                        ),
                        Text(
                          """Questions in easy-level quizzes are generally designed to be straightforward and simple.
The focus is on testing basic knowledge and fundamental concepts of a subject.
Multiple-choice questions with clear and direct answer options are commonly used.
Easy quizzes are often suitable for beginners or those with minimal background knowledge in the topic.
The questions may cover broad topics or have a general scope.""",style: TextStyle(color: AppColors.white),),
                        SizedBox(
                          height: 24,
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.white,
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 40,
                            width: 327,
                            child: Text(
                              "Normal/Medium Level::",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color:AppColors.white
                              ),
                            ),
                          ),
                        ),
                        Text(
                          """Medium-level quizzes are designed to provide a balanced challenge to participants.
Questions in this level often require a moderate level of understanding and critical thinking.
Multiple-choice, true/false, or fill-in-the-blank questions may be used, depending on the subject and context.
Medium-level quizzes may cover specific subtopics within a broader subject area.
These quizzes aim to assess participants' comprehension and application of knowledge rather than mere recall.""",style: TextStyle(color: AppColors.white),),
                        SizedBox(
                          height: 24,
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.white,
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 40,
                            width: 327,
                            child: Text(
                              "Hard Level:",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color:AppColors.white
                              ),
                            ),
                          ),
                        ),
                        Text(
                          """Hard-level quizzes are intended to be more challenging and demanding.
Questions in this level often involve complex scenarios, in-depth analysis, or application of advanced concepts.
Open-ended questions, essay-style questions, or questions that require calculations or problem-solving skills may be included.
Hard quizzes are typically designed for participants with a strong knowledge base in the subject.
These quizzes can be used to evaluate expertise, critical thinking abilities, and the ability to handle advanced concepts or real-world scenarios.""",style: TextStyle(color: AppColors.white),),
                        SizedBox(
                          height: 24,
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.white,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "It's important to note that the exact definition and difficulty of quiz levels can vary depending on the context, the subject matter, and the intended audience. The above description provides a general overview of what you can typically expect from quizzes categorized as easy, normal, and hard.",
                            style: TextStyle(
                                color: AppColors.white
                            ),
                          ),
                        ),
                        Divider(thickness: 1,color: AppColors.white,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
