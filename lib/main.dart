import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner/generate_qr/generate_qr.dart';
import 'package:qr_scanner/scan_qr/scan_qr.dart';
import 'package:qr_scanner/generate_qr/FloatingShare.dart';
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
        theme: ThemeData(
          primaryColor: Colors.grey[900],
          accentColor: Colors.amber[700],
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
        leading: Icon(
          Icons.qr_code_outlined,
          color: Colors.white70,
        ),
        shadowColor: Colors.white,
        title: Text(
          "Qr Scaner & Generator",
          style: TextStyle(color: Colors.white70),
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Center(
        child: _screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
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
