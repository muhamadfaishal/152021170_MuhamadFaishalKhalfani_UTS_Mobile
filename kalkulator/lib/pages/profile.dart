import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'kalkulator.dart';
import 'login.dart';
import 'bmi.dart';
import 'matauang.dart';
import 'indeksmahasiswa.dart';
import 'suhu.dart';
import 'about.dart';

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

class ProfilePage extends StatefulWidget {
  final String username;
  ProfilePage({required this.username});
  @override
  _SuhuPageState createState() => _SuhuPageState();
}

class _SuhuPageState extends State<ProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController input1Controller = TextEditingController();
  ActivePage activePage = ActivePage.Profile;
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Cek apakah kita berada di halaman profile
        if (activePage == ActivePage.Profile) {
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
          title: Text('Profile'),
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
            ],
          ),
        ),
        body: Container(
          color: Color(0xFF03006A),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Color(0xFF03006A),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '${widget.username}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
