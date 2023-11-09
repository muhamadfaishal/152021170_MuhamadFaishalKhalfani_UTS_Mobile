import 'package:flutter/material.dart';
import 'package:kalkulator/pages/about.dart';
import 'package:kalkulator/pages/indeksmahasiswa.dart';
import 'package:kalkulator/pages/matauang.dart';
import 'package:kalkulator/pages/profile.dart';
import 'kalkulator.dart';
import 'login.dart';
import 'bmi.dart';
import 'suhu.dart';

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

class DashboardPage extends StatefulWidget {
  final String username;

  DashboardPage({required this.username});
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _usernameController = TextEditingController();
  ActivePage activePage = ActivePage.Home;
  PageController _pageController = PageController(initialPage: 0);

  List<String> imagePaths = [
    'assets/images/itenas.jpg',
    'assets/images/StudentCenter.png',
    'assets/images/GSG.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
                        KalkulatorPage(username: widget.username),
                  ),
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
                      builder: (context) => BMIPage(username: widget.username)),
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
              title: Text('Indeks Nilai'),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Halo ${widget.username}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildShortcutCard(
                      title: 'Kalkulator',
                      icon: Icons.calculate,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                KalkulatorPage(username: widget.username),
                          ),
                        );
                      },
                    ),
                    _buildShortcutCard(
                      title: 'BMI',
                      icon: Icons.accessibility,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BMIPage(username: widget.username),
                          ),
                        );
                      },
                    ),
                    _buildShortcutCard(
                      title: 'Suhu',
                      icon: Icons.thermostat,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SuhuPage(username: widget.username),
                          ),
                        );
                      },
                    ),
                    _buildShortcutCard(
                      title: 'Mata Uang',
                      icon: Icons.monetization_on,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MataUangPage(username: widget.username),
                          ),
                        );
                      },
                    ),
                    _buildShortcutCard(
                      title: 'Indeks Nilai',
                      icon: Icons.assignment,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                IndeksMahasiswaPage(username: widget.username),
                          ),
                        );
                      },
                    ),
                    _buildShortcutCard(
                      title: 'Profile',
                      icon: Icons.person,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfilePage(username: widget.username),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Informasi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 200,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: imagePaths.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 8), // Tambahkan margin
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      12), // Tambahkan border radius
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(imagePaths[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Institut Teknologi Nasional (ITENAS) (aksara Sunda: ᮄᮔ᮪ᮞ᮪ᮒᮤᮒᮥᮒ᮪ ᮒᮦᮊ᮪ᮔᮧᮜᮧᮌᮤ ᮔᮞᮤᮇᮔᮜ᮪) adalah sebuah perguruan tinggi swasta di Kota Bandung. Itenas diresmikan pada tahun 1972 dengan R. Mansoer Wiratmadja sebagai rektor pertamanya. Saat ini Itenas memiliki 17 program studi yang dinaungi oleh tiga fakultas, yaitu Fakultas Teknologi Industri, Fakultas Teknik Sipil dan Perencanaan, dan Fakultas Arsitektur dan Desain. Maksud dan tujuan didirikannya yayasan ini adalah untuk melakukan kegiatan dalam bidang pendidikan dengan arti yang seluas-luasnya, termasuk di dalamnya mendirikan perguruan tinggi.[1] Dengan SK Dewan Pengurus Yayasan Pendidikan Dayang Sumbi No. 01/Kep/DS/1972 tanggal 14 Desember 1972, didirikan Akademi Teknologi Nasional (Atenas) yang terdiri dari jurusan: Arsitektur, Sipil, Elektro, dan Mesin. Pada saat itu diangkat Prof. R. Soetedjo, Ir., sebagai direktur Atenas.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShortcutCard({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 48,
              color: Color(0xFF03006A),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
