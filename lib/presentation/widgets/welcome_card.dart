import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/presentation/widgets/widgets.dart';

class WelcomeCard extends StatelessWidget {
  final int completedCounter;
  final int pendingCounter;
  final int remindersCounter;

  const WelcomeCard({
    super.key,
    required this.completedCounter,
    required this.pendingCounter,
    required this.remindersCounter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(22),
          bottomRight: Radius.circular(22),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1, 0),
          colors: [
            Color(0xff2C3E50),
            Color(0xff000000),
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset(
            'assets/images/image.png',
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Lister 👋',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your day looks like this:',
                    style: GoogleFonts.roboto(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TasksCounterCard(
                    tasksCounter: pendingCounter,
                    typeTask: 'pending',
                    iconData: Icons.calendar_month_rounded,
                  ),
                  TasksCounterCard(
                    tasksCounter: completedCounter,
                    typeTask: 'completed',
                    iconData: Icons.check_circle,
                  ),
                  TasksCounterCard(
                    tasksCounter: remindersCounter,
                    typeTask: 'reminders',
                    iconData: Icons.access_time_filled,
                  ),
                ],
              ),
            ),
          ),

          // SEARCHBAR
          Positioned(
            right: 0,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimSearchBar(
                autoFocus: false,
                width: MediaQuery.of(context).size.width * 0.9,
                textController: TextEditingController(),
                prefixIcon:
                    const Icon(Icons.search, color: Colors.black),
                suffixIcon:
                    const Icon(Icons.clear, color: Colors.black),
                textFieldIconColor: const Color(0xff9C9A9A),
                style: GoogleFonts.roboto(color: Colors.black),
                cursorColor: Colors.black,
                onSuffixTap: () {},
                onSubmitted: (value) {
                  // print(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TasksCounterCard extends StatelessWidget {
  final int tasksCounter;
  final String typeTask;
  final IconData iconData;

  const TasksCounterCard({
    super.key,
    required this.tasksCounter,
    required this.typeTask,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 28,
        width: 152,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 12, 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '$tasksCounter tasks $typeTask',
                style: GoogleFonts.roboto(
                  color: const Color.fromARGB(0, 0, 0, 0).withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
