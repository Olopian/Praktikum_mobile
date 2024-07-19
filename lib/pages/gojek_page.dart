import 'package:flutter/material.dart';

class GojekPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/gojek_logo.png', // Ganti dengan path logo Gojek Anda
          height: 40,
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGoPayMenu(context),
              SizedBox(height: 16),
              _buildGojekMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGoPayMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "GoPay",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGoPayIcon(context, Icons.account_balance_wallet, "Transfer"),
              _buildGoPayIcon(context, Icons.qr_code_scanner, "Scan QR"),
              _buildGoPayIcon(context, Icons.attach_money, "Isi Saldo"),
              _buildGoPayIcon(context, Icons.more_horiz, "Lainnya"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGoPayIcon(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.white),
        SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildGojekMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Layanan Gojek",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildServiceIcon(context, Icons.motorcycle, "GoRide"),
            _buildServiceIcon(context, Icons.local_taxi, "GoCar"),
            _buildServiceIcon(context, Icons.local_taxi, "Go-Bluebird"),
            _buildServiceIcon(context, Icons.local_dining, "GoFood"),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildServiceIcon(context, Icons.delivery_dining, "GoSend"),
            _buildServiceIcon(context, Icons.local_offer, "GoDeals"),
            _buildServiceIcon(context, Icons.phone_android, "GoPulsa"),
            _buildServiceIcon(context, Icons.more_horiz, "Lainnya"),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceIcon(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.green),
        SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
