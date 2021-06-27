import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/generate_qr/generate_qr.dart';
import 'package:qr_scanner/scan_qr/scan_qr.dart';
import 'package:qr_scanner/generate_qr/floating_share.dart';
import 'generate_qr/generate_bloc.dart';

void main() {
  runApp(
    BlocProvider(create: (_) => GenerateBloc(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateBloc, GenerateState>(builder: (context, state) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR scanner',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[700],
          colorScheme: ColorScheme.light(),
          primaryColor: Colors.grey[900],
          accentColor: Colors.amber[700],
          backgroundColor: Colors.grey[100],
          hintColor: Colors.grey[500],
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[900],
          colorScheme: ColorScheme.dark(),
          primaryColor: Colors.white70,
          accentColor: Colors.amber[700],
          backgroundColor: Colors.black,
          hintColor: Colors.black,
        ),
        home: MyHomePage(),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[Generate(), Scan()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Icon(
          Icons.qr_code_outlined,
          color: Colors.white70,
        ),
        shadowColor: Colors.black,
        title: Text(
          "Qr Scaner & Generator",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_2_outlined,
            ),
            label: "Generate",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_scanner,
            ),
            label: "Scan",
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white70,
        selectedIconTheme: IconThemeData(color: Theme.of(context).accentColor),
        selectedFontSize: 16,
      ),
      floatingActionButton: _selectedIndex == 0 ? FloatingShare() : null,
    );
  }
}
