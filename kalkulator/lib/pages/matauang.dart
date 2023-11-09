import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'kalkulator.dart';
import 'login.dart';
import 'bmi.dart';
import 'suhu.dart';
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

class MataUangPage extends StatefulWidget {
  final String username;
  MataUangPage({required this.username});
  @override
  _MataUangPageState createState() => _MataUangPageState();
}

class _MataUangPageState extends State<MataUangPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController rupiahController = TextEditingController();
  TextEditingController usdController = TextEditingController();
  ActivePage activePage = ActivePage.MataUang;
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

  void convertRupiahToUSD() {
    double rupiah = double.tryParse(rupiahController.text) ?? 0;
    double usd = rupiah / 15000; // Kurs 1 USD = 15,000 Rupiah
    usdController.text = usd.toStringAsFixed(2);
  }

  void convertUSDToRupiah() {
    double usd = double.tryParse(usdController.text) ?? 0;
    double rupiah = usd * 15000; // Kurs 1 USD = 15,000 Rupiah
    rupiahController.text = rupiah.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Cek apakah kita berada di halaman mata uang
        if (activePage == ActivePage.MataUang) {
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
          title: Text('Konversi Mata Uang'),
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
                          'assets/images/dollar.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      TextField(
                        controller: rupiahController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Rupiah (IDR)',
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
                      ElevatedButton(
                        onPressed: convertRupiahToUSD,
                        child: Text('Convert to USD'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF03006A)),
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 50)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: usdController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'US Dollar (USD)',
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
                      ElevatedButton(
                        onPressed: convertUSDToRupiah,
                        child: Text('Convert to Rupiah'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF03006A)),
                          minimumSize: MaterialStateProperty.all(
                              Size(double.infinity, 50)),
                        ),
                      ),
                      SizedBox(height: 140)
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
