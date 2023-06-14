import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';

import '../home_screen.dart';

class About extends StatelessWidget {
  const About({
    super.key,
  });

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
                          return const StartScreen();
                        }),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: height * (5 / 812)),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.white,
                      ),
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
                              "About Us?",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                        Text(
                          """A quiz may be a game during a kind of a tricking-brain under which the players try to answer the subsequent questions being asked in several types like multiple choice, drop-down and more. It’s a game to check the person’s knowledge and skill to trick their brains on some certain subject or topic. A quiz game in some countries is alleged to be a short assessment test that needs some basic knowledge in several fields and to live the knowledge, abilities, and skills of someone in terms of percentage or marks.

Quiz games are nevertheless more famous nowadays which too for a reason. It’s more important to grasp why people need more and more of it and what reasonable quizzes they have. People nowadays wish to challenge themselves and their friends with their knowledge and skills. Through these quizzes, people test their knowledge level, and also daily, they will examine themselves and grow regarding their knowledge and that they examine more if there’s a competitor out there to beat them up!

The quizzes can benefit the people under sections like education and business field which is great to understand the feedback of the staff under business areas and education, it’s great as people increase their knowledge and learning with fun.
                        """,
                          style: TextStyle(color: AppColors.white),
                        ),
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
                              "Introduction",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                            ),
                          ),
                        ),
                        Text(
                          """Testing is an effective learning method,\nand it is the basis of mobile quiz apps.\nQuiz apps have the potential to facilitate remote and self-regulated learning. In this context, automatized feedback plays a crucial role.\nIn two experimental studies, we examined the effects of two feedback types of quiz apps on performance, namely, the standard corrective feedback of quiz apps and a feedback that incorporates additional information related to the correct response option. We realized a controlled lab setting (n = 68, Study 1) and an unsupervised mobile setting (n = 150, Study 2). In the learning phase, participants used the quiz app and received feedback. They also completed a subsequent test as well as a follow-up test 1 week later by using the same quiz app. Irrespective of feedback type and setting, cognitive outcomes (quiz scores) and metacognitive outcomes (response certainty) increased similarly in the short term and long term. Feedback effects were not moderated by participants' overall response certainty during learning, their prior knowledge, and the difficulty of quiz items. Moreover, we found that participants perceived the quiz app to be similarly attractive, interesting, and enjoyable in both feedback conditions and that they spent slightly more time to process quiz items in the lab setting. We discuss these results in detail, including the role of moderating and mediating factors and prospects for further research and practice. Overall, our results underline that quiz apps are useful and effective tools that can support the acquisition and retention of semantic knowledge in different learning settings.\n\nMobile quiz applications (quiz apps) are popular and interactive software applications that have been used in television shows (Spearing and Transvaal, 2008), social media (Mossbauer, 2014), and various educational settings. Educational settings include face-to-face (Huns et al., 2016), online (Bloatwares et al., 2017), and combined settings such as blended learning (Spanners et al., 2015). In face-to-face settings, quizzes can function as audience response systems but with rather small effects on cognitive outcomes, as shown by meta-analytic results (Huns et al., 2016). Online/mobile settings include self-regulated learning processes (see Bjork et al., 2013) that can be supported by quiz apps. In general, quiz apps can function as formative learning tools that enable learners to (self-)monitor gains in achievement scores and that help them to develop cognitive processes related to self-regulated learning (McLoughlin and Yan, 2017). An effective and efficient way of learning with quiz apps is to process multiple-choice tests in single-choice format, which requires learners to identify the correct response option (target) from several options. This test format can support long-term retrieval (Digger et al., 2011), but Digger and Butler (2011, p. 20) also pointed out that “feedback enhances the benefits of testing”.
                            """,
                          style: TextStyle(color: AppColors.white),
                        ),
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
                            "Created by: Zoyidov Nurmuxammad",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: AppColors.C_5200FF),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.white,
                        )
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
