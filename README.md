# flutter-dart-training
Flutter and Dart Training

### Create flutter app
`$ flutter create ex01_statelss_widget`

### Go to flutter app
``$ cd ex01_statelss_widget``

### Run flutter app
``$ flutter run``



> [!TIP]
> The **pubspec.yaml** the file is a configuration file used by the Dart package manager, pub to manage your Flutter project's dependencies and settings. It's where you define everything from the name of your project to the third-party packages you want to use in your app.   
```yaml
            # pubspec.yaml
            name: ex01_statelss_widget
            description: "A new Flutter project."
            publish_to: 'none' 
            version: 1.0.0+1

            environment:
            sdk: '>=3.2.3 <4.0.0'

            dependencies:
            flutter:
                sdk: flutter

            cupertino_icons: ^1.0.2

            dev_dependencies:
            flutter_test:
                sdk: flutter

            flutter_lints: ^2.0.0

            flutter:
            uses-material-design: true

```
<details>

</details>

> [!TIP]
> **lib/main.dart**: The main function by itself is the Dart entry point of an application. What makes the Flutter application take the scene is the runApp function called by passing a widget as a parameter, which will be the root widget of the application (the application itself).
```dart
            # main.dart
            import 'package:flutter/material.dart';

            void main() {
            runApp(const MyApp());
            }

            class MyApp extends StatelessWidget {
            const MyApp({super.key});

            @override
            Widget build(BuildContext context) {
                return const MaterialApp(
                title: 'Stateless Widget Flutter Demo',
                home: GreetingScreen(),
                );
            }
            }

            class GreetingScreen extends StatelessWidget {
            const GreetingScreen({super.key});

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                appBar: AppBar(
                    title: const Text('Welcome!'),
                ),
                body: const Center(
                    child: Text(
                    'Instill Learning',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold ),
                    ),
                ),
                );
            }
            }
```
### Screen
![stateless widge example](https://github.com/progaurab/flutter-dart-training/blob/master/flutter_Apps/screenshots/ex01_statelss_widget.png)

> [!IMPORTANT]
> **State**: The state is data. The state is information. Flutter uses this data to build the user interface. We all know Flutter is a declarative framework. This Means Flutter builds its User Interface to reflect the current state of the app.

> [!IMPORTANT]
> **Stateless Widget**: A stateless widget never changes. Icon , IconButton , and Text are examples of stateless widgets.

> [!IMPORTANT]
> **Stateful Widget**: A stateful widget is dynamic: for example, it can change its appearance in response to events triggered by user interactions or when it receives data. Checkbox , Radio , Slider , InkWell , Form , and TextField are examples of stateful widgets.



> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!WARNING]
> 

> [!CAUTION]
> 
