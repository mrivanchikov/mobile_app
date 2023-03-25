
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: PageNavBar()
    );
  }

}

class PageNavBar extends StatelessWidget {
  const PageNavBar({Key? key}) : super(key: key);

  MaterialStateProperty<Color> setShadowColor(Color shadowColor){
    final setShadowColor = (Set<MaterialState> states){return shadowColor;};
    return MaterialStateProperty.resolveWith(setShadowColor);
  }

  MaterialStateProperty<Color> setButtonColor(Color disabledButtonColor, Color activeButtonColor){
    final setButtonColor = (Set<MaterialState> states){
      if(states.contains(MaterialState.pressed)){
        return activeButtonColor;
      }
      else {return disabledButtonColor;
      }
    };
    return MaterialStateProperty.resolveWith(setButtonColor);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(onPressed: () {},label: const Text(''), icon: const Icon(Icons.home_filled),style: ButtonStyle(shadowColor: setShadowColor(Colors.white), backgroundColor: setButtonColor(Colors.white, Colors.orange),),),
        ElevatedButton.icon(onPressed: () {}, label: const Text(''), icon: const Icon(Icons.search_outlined),),
        ElevatedButton.icon(onPressed: () {}, label: const Text(''), icon: const Icon(Icons.shopping_bag_outlined)),
        ElevatedButton.icon(onPressed: () {}, label: const Text(''), icon: const Icon(Icons.person_2_outlined)),
    ],);

  }
}
