import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'kalkulator.dart';
import 'login.dart';
import 'bmi.dart';
import 'matauang.dart';
import 'indeksmahasiswa.dart';
import 'about.dart';
import 'profile.dart';

enum ActivePage {
  Home,
  Kalkulator,
  BMI,
  Suhu,
  MataUang,
  IndeksMahasiswa,
  Profile,
  About
}

class SuhuPage extends StatefulWidget {
  final String username;
  SuhuPage({required this.username});
  @override
  _SuhuPageState createState() => _SuhuPageState();
}

class _SuhuPageState extends State<SuhuPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController input1Controller = TextEditingController();
  TextEditingController outputController = TextEditingController();
  ActivePage activePage = ActivePage.Suhu;
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.username);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void calculate(String operator) {
    double input1 = double.tryParse(input1Controller.text) ?? 0;
    double result = 0;

    switch (operator) {
      case 'F':
        result = (9 / 5) * input1 + 32;
        break;
      case 'K':
        result = input1 + 273.15;
        break;
      case 'R':
        result = (4 / 5) * input1;
        break;
    }
    outputController.text =
        result.toStringAsFixed(2); // Menampilkan 2 angka di belakang koma
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Cek apakah kita berada di halaman suhu
        if (activePage == ActivePage.Suhu) {
          // Navigasi kembali ke halaman dasbor
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => DashboardPage(username: widget.username),
            ),
          );
          // Mengembalikan nilai true untuk mencegah penanganan default
          return false;
        } else {
          // Jika bukan halaman kalkulator, biarkan Flutter menangani tombol kembali
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Konversi Suhu'),
          backgroundColor: Color(0xFF03006A),
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(widget.username),
                accountEmail: null,
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    widget.username[0],
                    style: TextStyle(fontSize: 40.0, color: Color(0xFF03006A)),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF03006A),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  setState(() {
                    activePage = ActivePage.Home;
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DashboardPage(username: _usernameController.text),
                    ),
                  );
                },
                tileColor: activePage == ActivePage.Home
                    ? Color.fromARGB(255, 190, 189, 189)
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.calculate),
                title: Text('Kalkulator'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            KalkulatorPage(username: widget.username)),
                  );
                },
                tileColor: activePage == ActivePage.Kalkulator
                    ? Color.fromARGB(255, 190, 189, 189)
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.accessibility),
                title: Text('BMI'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BMIPage(username: widget.username)),
                  );
                },
                tileColor: activePage == ActivePage.BMI
                    ? Color.fromARGB(255, 190, 189, 189)
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.thermostat),
                title: Text('Suhu'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SuhuPage(username: widget.username)),
                  );
                },
                tileColor: activePage == ActivePage.Suhu
                    ? Color.fromARGB(255, 190, 189, 189)
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('Mata Uang'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MataUangPage(username: widget.username)),
                  );
                },
                tileColor: activePage == ActivePage.MataUang
                    ? Color.fromARGB(255, 190, 189, 189)
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.assignment),
                title: Text('Indeks Mahasiswa'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            IndeksMahasiswaPage(username: widget.username)),
                  );
                },
                tileColor: activePage == ActivePage.IndeksMahasiswa
                    ? Color.fromARGB(255, 190, 189, 189)
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(username: widget.username)),
                  );
                },
                tileColor: activePage == ActivePage.Profile
                    ? Color.fromARGB(255, 190, 189, 189)
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AboutPage(username: widget.username)),
                  );
                },
                tileColor: activePage == ActivePage.About
                    ? Color.fromARGB(255, 190, 189, 189)
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Konfirmasi Logout'),
                        content: Text('Apakah Anda yakin ingin logout?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Batal'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Tutup dialog
                            },
                          ),
                          TextButton(
                            child: Text('Logout'),
                            onPressed: () {
                              // Implementasi logout di sini
                              // Setelah logout, pindah ke halaman login
                              Navigator.of(context).pop(); // Tutup dialog
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              // ... Add other ListTile widgets for different pages.
            ],
          ),
        ),
        body: Container(
          color: Color(0xFF03006A),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 16.0, 0, 200.0),
              child: Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                        child: Image.asset(
                          'assets/images/suhu.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      TextField(
                        controller: input1Controller,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Masukan Suhu (°C)',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF03006A)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () => calculate('F'),
                            child: Text('°F'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF03006A)),
                              minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 50)),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => calculate('K'),
                            child: Text('K'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF03006A)),
                              minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 50)),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => calculate('R'),
                            child: Text('R'),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF03006A)),
                              minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, 50)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: outputController,
                        readOnly: true,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Hasil',
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF03006A)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 80)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
