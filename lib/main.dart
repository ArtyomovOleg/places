import 'package:flutter/material.dart';

void main() {
  runApp(App());
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
// Не найден файл с точкой входа в приложение.
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
