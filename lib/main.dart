import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key ? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      home: WelcomePage (),
    );
  }
}
class WelcomePage extends StatelessWidget {

  const WelcomePage({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F82A1),
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            SizedBox(height: 20,),
            Column(
              children: [
                Image.asset(
                  'images/orangbaca.jpg',
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Welcome',
                  style: TextStyle(fontFamily: 'Fredoka', fontSize: 48),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'selamat datang di Perpustakaan Digital Kota Palembang',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 2 * 24,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellowAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 2 * 24,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFF5C2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Created By Lutfi@2023',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Monserrat', fontSize: 15),
                ),
                SizedBox(height: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F82A1),
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika autentikasi di sini
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Contoh sederhana: validasi jika username dan password tidak kosong
                if (username.isNotEmpty && password.isNotEmpty) {
                  // Tambahkan logika untuk penanganan autentikasi berhasil di sini
                  // Misalnya, pindah ke halaman selanjutnya atau tampilkan pesan berhasil
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login berhasil!'),
                    ),
                  );
                } else {
                  // Tampilkan pesan kesalahan jika username atau password kosong
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Username dan password harus diisi!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F82A1),
      appBar: AppBar(
        title: Text('Register Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField("Username", _usernameController),
            _buildTextField("Password", _passwordController, isPassword: true),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle registration logic here
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Implement registration logic
                print('Username: $username, Password: $password');
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}