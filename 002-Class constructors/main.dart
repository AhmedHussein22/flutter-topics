// ignore_for_file: avoid_print

//! 1- Default Constructor example
class PersonDefaultConstructor {
  String? name;
  int? age;
  // Default Constructor
  // If no constructor is defined, Dart provides this default constructor:
  // PersonDefaultConstructor();
}

//! Named Constructor example
class PersonNamedConstructor {
  String name;
  int age;
  // Default Constructor
  PersonNamedConstructor(this.name, this.age);
  // Named Constructor
  PersonNamedConstructor.withName(String name) : this(name, 0);
  // Another Named Constructor
  PersonNamedConstructor.withAge(int age) : this('Unknown', age);
}

//! Factory Constructor example
class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal();
}

//! Redirecting Constructor example
class PersonRedirectingConstructor {
  String name;
  int age;

  // Default Constructor
  PersonRedirectingConstructor(this.name, this.age);

  // Redirecting Constructor
  PersonRedirectingConstructor.young(String name) : this(name, 18);
}

//! Constant Constructor example
class ImmutablePoint {
  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

//! Generative Constructor example
class Circle {
  double radius;

  // Generative Constructor
  Circle(this.radius);
}

void main() {
  //*1- Default Constructor
  print('***********Default Constructor***********');
  var person = PersonDefaultConstructor();
  print('${person.name}, ${person.age}'); // Output: null, null

  //*2- Named Constructor
  print('***********Named Constructor***********');
  var person1 = PersonNamedConstructor.withName('Ahmed');
  print('${person1.name}, ${person1.age}'); // Output: Bob, 0

  var person2 = PersonNamedConstructor.withAge(25);
  print('${person2.name}, ${person2.age}'); // Output: Unknown, 25
  //*3- Singleton
  print('***********Singleton***********');
  var s1 = Singleton();
  var s2 = Singleton();
  print(identical(s1, s2)); // Output: true
  // *4- Redirecting Constructor
  print('***********Redirecting Constructor***********');
  var youngPerson = PersonRedirectingConstructor.young('Ahmed');
  print('${youngPerson.name}, ${youngPerson.age}'); // Output: Charlie, 18

  // * 5-Constant Constructor
  print('***********Constant Constructor***********');
  var point = const ImmutablePoint(1.0, 2.0);
  print('(${point.x}, ${point.y})'); // Output: (1.0, 2.0)

  // *6- Generative Constructor
  print('***********Generative Constructor***********');

  var circle = Circle(5.0);
  print(circle.radius); // Output: 5.0// Output: 5.0
}
























































// void main() {
//  // runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const BadScrollWithListView(),
//     );
//   }
// }
