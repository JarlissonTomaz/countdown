import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temporizador_teste/provider/time_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final countdownProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Countdown'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                countdownProvider
                    .setCountdownDuration(const Duration(seconds: 60));
              },
              icon: const Icon(Icons.restart_alt),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    size: 70,
                    color: Colors.blue,
                  ),
                  Text(
                    context.select(
                        (TimerProvider countdown) => countdown.timeLeftString),
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              countdownProvider.startStopTimer();
            },
            child: Icon(
              countdownProvider.isRunning
                  ? Icons.pause
                  : Icons.play_arrow_outlined,
            )));
  }
}
