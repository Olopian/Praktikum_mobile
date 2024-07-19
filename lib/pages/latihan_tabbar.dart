import 'package:flutter/material.dart';

class LatihanTabBar extends StatelessWidget {
  const LatihanTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(
                  child: Text('All'),
                ),
              ],
            ),
            title: Text('Latihan AppBar'),
          ),
          body: TabBarView(
            children: [
              _buildTabContent(Icons.directions_car),
              _buildTabContent(Icons.directions_transit),
              _buildTabContent(Icons.directions_bike),
              _buildAllTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(IconData iconData) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var rowTrans = trans[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(rowTrans.foto, size: 70),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rowTrans.nama,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(rowTrans.deskripsi),
                    ],
                  ),
                ],
              ),
              Icon(
                rowTrans.isLike ? Icons.favorite : Icons.favorite_border,
                color: rowTrans.isLike ? Colors.red : Colors.grey[300],
              ),
            ],
          ),
        );
      },
      itemCount: trans.length,
    );
  }

  Widget _buildAllTabContent() {
    return ListView.builder(
      itemBuilder: (context, index) {
        var rowTrans = trans[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(rowTrans.foto, size: 70),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rowTrans.nama,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(rowTrans.deskripsi),
                    ],
                  ),
                ],
              ),
              Icon(
                rowTrans.isLike ? Icons.favorite : Icons.favorite_border,
                color: rowTrans.isLike ? Colors.red : Colors.grey[300],
              ),
            ],
          ),
        );
      },
      itemCount: trans.length,
    );
  }
}

class Transports {
  final IconData foto;
  final String nama;
  final String deskripsi;
  final bool isLike;

  Transports({
    required this.foto,
    required this.nama,
    required this.deskripsi,
    required this.isLike,
  });
}

// Data Dummy Transport
var trans = [
  Transports(
    foto: Icons.directions_car,
    nama: 'Mobil Sedan',
    deskripsi: 'Kendaraan Roda Empat',
    isLike: true,
  ),
  Transports(
    foto: Icons.directions_transit,
    nama: 'Kereta Api',
    deskripsi: 'Angkutan Gerbong dengan Rel',
    isLike: false,
  ),
  Transports(
    foto: Icons.directions_bike,
    nama: 'Sepeda Motor',
    deskripsi: 'Kedaraan roda dua pribadi',
    isLike: true,
  ),
  Transports(
    foto: Icons.directions_boat,
    nama: 'Speed Boat',
    deskripsi: 'Perahu Mesin Jet',
    isLike: false,
  ),
  Transports(
    foto: Icons.directions_boat,
    nama: 'Kapal Ferry',
    deskripsi: 'Perahu Besar Mesin Besar',
    isLike: true,
  ),
  Transports(
    foto: Icons.directions_boat,
    nama: 'Sampan Kayu',
    deskripsi: 'Perahu Dayung Apung',
    isLike: false,
  ),
  Transports(
    foto: Icons.directions_bus,
    nama: 'Mobil Bus',
    deskripsi: 'Mobil Bus Besar',
    isLike: true,
  ),
  Transports(
    foto: Icons.directions_bike,
    nama: 'Sepeda',
    deskripsi: 'Kedaraan roda dua pribadi',
    isLike: false,
  ),
  Transports(
    foto: Icons.shopping_cart,
    nama: 'Troli',
    deskripsi: 'Pengangkutan Barang Sorong',
    isLike: false,
  ),
];
