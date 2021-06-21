import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class SecondRoute extends StatelessWidget {
  final String text;
  SecondRoute({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text + " Thanks for submitting",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!')),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'task2'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "task2";
  TextEditingController name = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              setState(() {});
            },
          )
          //InkWell(
          //child: Icon(Icons.ac_unit),
          //onTap: () {
          //setState(() {
          // title = "hello";
          //});
          // },
          // ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text("Heyya"),
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text("see user"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.atm),
              title: Text("add card"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add_a_photo),
              title: Text("add photo"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Image.asset('images/home.jpg', width: 200, height: 200),
                Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/81HgVEqBVuL._SL1500_.jpg',
                    width: 200,
                    height: 300),
              ],
            ),
            Text("Hi,This is task 2", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Icon(
                  Icons.ac_unit,
                  size: 50,
                ),
                Icon(
                  Icons.add_alarm_outlined,
                  size: 50,
                ),
                Icon(
                  Icons.accessible_outlined,
                  size: 50,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'enter name'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondRoute(text: name.text.toString())),
                  );
                },
                child: const Text('submit')),
          ],
        ),
      ),
    );
  }
}
