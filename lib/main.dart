import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // 3.6.3.5 Поместите ваш виджет на место MyHomePage в Вашем проекте.
      home: MyStatefullWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// 3.6.3.1 Внутри созданного ранее проекта в папке main.dart создайте новый
//Stateless виджет.
// 3.6.3.2 Назовите его MyFirstWidget.
class MyFirstWidget extends StatelessWidget {
  // 3.6.3.4 Сделайте счетчик вызовов функции build() внутри виджета и выведите
  // его с помощью print().
  final counters = Counters();

  MyFirstWidget({Key? key}) : super(key: key);

  // 3.6.3.3 В методе build() возвратите следующее:
  @override
  Widget build(BuildContext context) {
    counters.cntBuild++;
    print('$runtimeType build: ${counters.cntBuild}');
    print('context.runtimeType: ${context.runtimeType}');

    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }

  // 3.6.4.5. Перейдем к рассмотрению контекста. В вашем Stateless виджет
  // создайте метод без аргументов, который будет возвращать
  // context.runtimeType. Получится ли реализовать подобное в данном виджете?
  Type get myRuntimeType => runtimeType;
}

class Counters {
  int cntBuild = 0;
}

// 3.6.3.7 Чему равно значение счетчика? Почему значение именно такое?
// Ответ: Значение счетчика равно 1. Т.к. это виджет без состояния и все данные
// перестраиваются заново.

// 3.6.3.8 Сделайте второй виджет(уже на основе Stateful). Повторите пункты 3-7.
// Ответ на вопрос изменился?
// Ответ: Да. В памяти сохраняется текущее состояние счетчика.
class MyStatefullWidget extends StatefulWidget {
  MyStatefullWidget({Key? key}) : super(key: key);

  @override
  _MyStatefullWidgetState createState() => _MyStatefullWidgetState();

  // 3.6.4.6. Проделайте предыдущий пункт в рамках Stateful. В чем разница?
  Type get myRuntimeType => runtimeType;
}

class _MyStatefullWidgetState extends State<MyStatefullWidget> {
  final counters = Counters();

  @override
  Widget build(BuildContext context) {
    counters.cntBuild++;
    print('$runtimeType build: ${counters.cntBuild}');
    print('context.runtimeType: ${context.runtimeType}');

    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}

// 3.6.4.1. Переименуйте файл main.dart в start.dart. Запустите проект. Почему
// результат именно таков?
// Не найдена файл с точкой входа в приложение.
// Target file "lib/main.dart" not found.

// 3.6.4.3. В файле main.dart создайте виджет приложения. Назовите его App.
class App extends StatelessWidget {
  // 3.6.4.4. В методе build() верните MaterialApp в поле home поставьте
  // Stateless виджет из предыдущего домашнего задания(см. урок про виджеты).
  // Рассмотрите его параметры. Задайте поле title. Запустите на Android. Где
  // отобразится значение этого поля?
  // Ответ: В описании написано, что отобразиться в "недавних" приложениях, а на
  // iOS значение параметра не используется. К задаче приложу скриншот.
  @override
  Widget build(BuildContext context) {
    final myFirstWidget = MyFirstWidget();
    final myStatefullWidget = MyStatefullWidget();
    // print('myRuntimeType: ${myFirstWidget.myRuntimeType.toString()}');
    print('myRuntimeType: ${myStatefullWidget.myRuntimeType.toString()}');
    return MaterialApp(
      title: 'App',
      // home: myFirstWidget,
      home: myStatefullWidget,
    );
  }
}
