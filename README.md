# flemme

Flutter , Light , Early, Making, Material, Environnement
Simplify the writing of your widgets with Flemme


## Installation
Add `flemme` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  flemme: ^0.0.3
```


## Get Started
For use Flemme object by following steps :
```dart
import 'package:flemme/flemme.dart';
```

#Defaut code Flutter Example:

```dart

Scaffold defaultFlutterScaffoldExample() {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
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
      child: const Icon(Icons.add),
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}

```

#Same with Flemme:

```dart
 
Scaffold flemmeScaffoldExample() {
  return Scaffold(
    appBar: AppBar(
      title: widget.title.toTextWidget(),
    ),
    body: [
      'You have pushed the button this many times:'.toTextWidget(),
      '$_counter'.toTextWidget(style: Theme.of(context).textTheme.headline4),
    ].listToColumn(mainAxisAlignment: MainAxisAlignment.center).withCenter(),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}

```

## Usage

```dart

//For create TextWidget (customisable) on String just call :
Text myText = 'sample'.toTextWidget();

//For use Center Widget
Center center = myText.withCenter();

```



