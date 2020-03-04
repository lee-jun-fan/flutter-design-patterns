import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter_online/Bloc.dart';
import 'package:test_flutter_online/bloc/weather_bloc.dart';
import 'package:test_flutter_online/mvp_dependency_injection/dependency/Injector.dart';
import 'package:test_flutter_online/mvp_dependency_injection/news_main.dart';
import 'package:test_flutter_online/screens/Chats.dart';
import 'package:test_flutter_online/screens/Peoples.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
  Injector.config(Flavor.PROD);
  runApp(NewsMain());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: BlocProvider(
          create: (_) => WeatherBloc(),
          child: BlocEg(),
        ));
  }
}

class Frame extends StatefulWidget {
  const Frame({Key key}) : super(key: key);

  @override
  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(
            padding: EdgeInsets.all(5),
            child: Ink(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple,
                image: DecorationImage(
                    image: NetworkImage(
                      "https://cdn.i-scmp.com/sites/default/files/styles/768x768/public/d8/images/methode/2019/09/27/f4dd7c10-e0ca-11e9-94c8-f27aa1da2f45_image_hires_101713.JPG?itok=K-_8RuBa&v=1569550639",
                    ),
                    fit: BoxFit.fill),
              ),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                onTap: () {
                  print("hello");
                },
              ),
            ),
          ),
          title: Text("Chats"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.camera),
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => {},
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), title: Text("Chats")),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text("People"))
          ],
          currentIndex: this.index,
          selectedItemColor: Colors.black,
          onTap: (int ix) {
            setState(() {
              index = ix;
            });
          },
        ),
        body: this.index == 0 ? Chats() : Peoples());
  }
}
