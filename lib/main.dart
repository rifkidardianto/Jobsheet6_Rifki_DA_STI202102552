import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: TeksUtama(),
    ),
  );
}

class TeksUtama extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const TeksUtama({Key? key});

  @override
  State<StatefulWidget> createState() => StateTeksUtamaState();
}

class StateTeksUtamaState extends State<TeksUtama> {
  var listData = [
    {'foto': 'rifki', 'nama': 'RIFKI DWI ARDIANTO ' '\nNIM : ' 'STI202102552'},
    {
      'foto': 'yasid',
      'nama': 'MUHAMAD YAZID FYZE RAHMAN' '\nNIM : ' 'STI202102545'
    },
    {'foto': 'hendri', 'nama': 'HENDRI HIDAYATULLAH' '\nNIM : ' 'STI202102546'},
    {'foto': 'faqih', 'nama': 'FAQIH FIKRI RIYANTO' '\nNIM : ' 'STI202102553'},
    {'foto': 'gigih', 'nama': 'GIGIH ARYADITA' '\nNIM : ' 'STI202102554'}
  ];
  var listWarna = [
    Colors.red,
    Colors.orange,
    Colors.blue,
    Colors.teal,
    Colors.indigo,
    Colors.deepPurple,
    Colors.cyan,
    Colors.blue,
    Colors.yellow
  ];
  int index = 0;

  void incrementIndex() {
    setState(() {
      index = (index + 1) % listData.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('StatefulWidget'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Selamat Datang',
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(
              height: 20,
            ), // Menambahkan jarak antara teks dan foto
            Row(
              children: [
                // Padding dan CircleAvatar untuk gambar
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'images/${listData[index % listData.length]['foto']}.jpg',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ), // Menambahkan jarak antara gambar dan teks
                // Teks di sebelah kanan
                Expanded(
                  child: Text(
                    listData[index % listData.length]['nama'] as String,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: listWarna[index % listWarna.length],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Refresh',
        onPressed: incrementIndex,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
