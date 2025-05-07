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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/': (context) => const FirstScreen(),
    '/second':(context) => const MyHomePage(title: 'Second Page'),

      }
    );
  }
}

class FirstScreen extends StatelessWidget{
  const FirstScreen({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get started"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed:(){
              Navigator.pushNamed(context, '/second');
            },
        child: const Text("Go yo the main page"),
        ),
      ),
    );
  }
}

class ImageItem {

  final int price;
  final String assetPath;

  ImageItem({required this.price, required this.assetPath});
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  //

  //
  List<ImageItem> images = [
    ImageItem( price: 10, assetPath: 'assets/images/aaa.jpg'),
    ImageItem(price: 20, assetPath: 'assets/images/bbb.jpg'),
    ImageItem( price: 15, assetPath: 'assets/images/ccc.jpg'),
    ImageItem( price: 25, assetPath: 'assets/images/ddd.jpg'),
    ImageItem( price: 30, assetPath: 'assets/images/eee.jpg'),
    ImageItem( price: 15, assetPath: 'assets/images/fff.jpg'),
    ImageItem( price: 40, assetPath: 'assets/images/ggg.jpg'),
    ImageItem( price: 75, assetPath: 'assets/images/hhh.jpg'),
    ImageItem( price: 30, assetPath: 'assets/images/iii.jpg'),
  ];

  int totalValue = 0;

  List<Widget> _buildGridTileList() {
    return images.map((item) {
      return Column(
        children: [
          Image.asset(item.assetPath, width:70, height: 70, fit: BoxFit.cover),

          Text('Price: ${item.price}'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                totalValue += item.price;
              });
            },
            child: const Text('Add'),
          ),
        ],
      );
    }).toList();
  }

  Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(),
  );







  //


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildGrid(), //
          ),
          const SizedBox(height: 10),
          Text(
            'Total Price: $totalValue',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                totalValue = 0;
              });
            },
            child: const Text('Clear'),
          ),
        ],
      ),
      /*Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // traverse image list











          //
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
       */
      //
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),

      //
    );
  }
}
