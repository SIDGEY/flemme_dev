# flemme

[![Plaftorm Flutter](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev) [![pub package](https://img.shields.io/pub/v/flemme.svg)](https://pub.dartlang.org/packages/flemme) [![GitHub stars](https://img.shields.io/github/stars/SIDGEY/flemme_dev)](https://github.com/SIDGEY/flemme_dev/stargazers) [![GitHub forks](https://img.shields.io/github/forks/SIDGEY/flemme_dev)](https://github.com/fluttercandies/extended_text_field/network)  [![GitHub license](https://img.shields.io/github/license/SIDGEY/flemme_dev)](https://github.com/SIDGEY/flemme_dev/blob/master/LICENSE)  [![GitHub issues](https://img.shields.io/github/issues/SIDGEY/flemme_dev)](https://github.com/SIDGEY/flemme_dev/issues)

Flutter , Light , Early, Making, Material, Environnement
Simplify the writing of your widgets with Flemme

## Installation

Add `flemme` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
  flemme: ^0.0.13
```

## Get Started

For use Flemme object by following steps :

```dart
import 'package:flemme/flemme.dart';
```

Defaut code Flutter Example:

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

Same with Flemme:

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

## For all Widget

Create and custom Padding
```dart
// default value :  EdgeInsets.all(8.0)
Padding myPadding = Text('sample').withPadding();

// you can custome like  :  
Padding myPadding = Text('sample').withPadding(padding: EdgeInsets.all(20.0));
```

Encapsulate your Widget in another

```dart
// Center
Center center = myText.withCenter();
// Flexible
// defaut value flex = 1 , FlexFir = FlexFit.tight
Flexible myFlexible = myText.withFlexible();
Flexible myFlexible = myText.withFlexible(flex:2);

//  Expanded
// defaut value flex = 1 
Expanded myExpanded = myText.withExpanded();
Expanded myExpanded = myText.withExpanded(flex:2);

//Container
Container myContainer = myText.withContainer();

//SizeBox
SizeBox mySizedBox = myText.withSizedBox();

//FractionallySizedBox
FractionallySizedBox myFractionallySizedBox = myText.withFractionallySizedBox();
```

Generate a modal from a widget

```dart
  //context is necessary
 Container().showHimself(context);

  // custom background color, default transparent:
  Container().showHimself(context, bgColor:Colors.red);

```

## For String

```dart
    //ellips text with '...' defaut value lenght 140
    String textShort = 'text too long'.ellipse();

    //custom lenght: 
    String textShort = 'text too long'.ellipse(lenght:32);
    
    //Convert quickly String to Text Widget
    Text myText = 'my sample'.toTextWidget();
    // you can custom with every Text parameter

```

## For DateTime

```dart
    //convert DateTime to short string 
    //String like 10 seconds ago, a minute ago, 7 hours ago, etc. if is before now
    //String like in 10 seconds , in a minute, in 7 hours, etc. if is after now
    String time = DateTime().returnDateSmall();


```

## For List<Widget>

```dart
List<Widget> myList = ['sample'.toTextWidget(),'sample'.toTextWidget(),'sample'.toTextWidget(),'sample'.toTextWidget()];

//Convert list to Row
Row myRow = myList.listToRow();

//Convert list to Column
Column myRow = myList.listToColumn();
```

## Configure and use default padding
You can use and config default padding. 

Call FlemmeConfig() for use and config. It's a single instance, you don't need to put it statically in your code, just call it where you need it. Preferably before your MaterialApp
```dart
 FlemmeConfig().paddingAllM = const EdgeInsets.all(100); // default padding

```

Default value is configure like this: 
```dart
  EdgeInsets paddingAllSM = const EdgeInsets.all(4);
  EdgeInsets paddingAllS = const EdgeInsets.all(8);
  EdgeInsets paddingAllM = const EdgeInsets.all(12);
  EdgeInsets paddingAllL = const EdgeInsets.all(20);
  EdgeInsets paddingAllXL = const EdgeInsets.all(32);
```
