import 'package:flutter/material.dart';

void main() async {
  debugPrint('Starting example...');

  // Example using await Future
  await exampleUsingAwaitFuture();

  // Example using Future.wait
  await exampleUsingFutureWait();

  debugPrint('Example finished.');
}

Future<void> exampleUsingAwaitFuture() async {
  debugPrint('Starting exampleUsingAwaitFuture...');
  await Future.delayed(const Duration(seconds: 3), () {
    debugPrint('First future completed');
  });
  await Future.delayed(const Duration(seconds: 1), () {
    debugPrint('Second future completed');
  });
  Future.delayed(const Duration(seconds: 2), () {
    debugPrint('Third future completed');
  });
  debugPrint('exampleUsingAwaitFuture finished.');
}

Future<void> exampleUsingFutureWait() async {
  debugPrint('Starting exampleUsingFutureWait...');
  await Future.wait([
    Future.delayed(const Duration(seconds: 3), () {
      debugPrint('First future completed');
    }),
    Future.delayed(const Duration(seconds: 1), () {
      debugPrint('Second future completed');
    }),
    Future.delayed(const Duration(seconds: 2), () {
      debugPrint('Third future completed');
    }),
    // Add more futures here
  ]);
  debugPrint('exampleUsingFutureWait finished.');
}

//* terminal output:

// flutter: Starting example...
//! ************* AwaitFuture  *******************
//* terminal output:


// flutter: Starting exampleUsingAwaitFuture...
// flutter: First future completed
// flutter: Second future completed
// flutter: Third future completed
// flutter: exampleUsingAwaitFuture finished.


//! ************* FutureWait  *******************
//* terminal output:

// flutter: Starting exampleUsingFutureWait...
// flutter: Second future completed
// flutter: Third future completed
// flutter: First future completed
// flutter: exampleUsingFutureWait finished.


// flutter: Example finished.