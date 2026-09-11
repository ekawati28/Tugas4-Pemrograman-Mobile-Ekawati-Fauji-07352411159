import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Detail Restoran',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF18A77A),
        ),
      ),
      home: const RestaurantDetailPage(),
    );
  }
}

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  // ============================
  // DATA RESTORAN
  // ============================

  final String restaurantName = 'La Brasserie Bistro';

  final String restaurantImage =
      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4'
      '?auto=format&fit=crop&w=1000&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      // =====================================
      // FLOATING ACTION BUTTON
      // =====================================
      floatingActionButton: SizedBox(
        width: 190,
        height: 52,
        child: FloatingActionButton.extended(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Reservasi berhasil dipilih'),
              ),
            );
          },
          backgroundColor: const Color(0xFF18A77A),
          foregroundColor: Colors.white,
          elevation: 4,
          icon: const Icon(Icons.calendar_month),
          label: const Text(
            'Reservasi Sekarang',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      // =====================================
      // BODY
      // =====================================
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // =====================================
              // BAGIAN GAMBAR + APP BAR
              // =====================================
              Stack(
                children: [

                  // GAMBAR RESTORAN
                  SizedBox(
                    width: double.infinity,
                    height: 260,
                    child: Image.network(
                      restaurantImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Icon(
                              Icons.restaurant,
                              size: 70,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // GRADIENT AGAR APPBAR TERLIHAT
                  Container(
                    height: 260,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.55),
                          Colors.transparent,
                          Colors.black.withOpacity(0.15),
                        ],
                      ),
                    ),
                  ),

                  // =====================================
                  // APP BAR TRANSPARAN
                  // =====================================
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Row(
                        children: [

                          // TOMBOL BACK
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),

                          // NAMA RESTORAN
                          const Expanded(
                            child: Text(
                              'La Brasserie Bistro',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // TOMBOL SHARE
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Membagikan restoran...',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // =====================================
              // CONTAINER INFORMASI UTAMA
              // =====================================
              Container(
                width: double.infinity,
                transform: Matrix4.translationValues(0, -18, 0),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // =====================================
                    // NAMA RESTORAN
                    // =====================================
                    const Text(
                      'La Brasserie Bistro',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222222),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // =====================================
                    // RATING + KATEGORI
                    // =====================================
                    Row(
                      children: [

                        // RATING
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF4D6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFFFB800),
                                size: 18,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 7),

                        const Text(
                          '(1.250 Ulasan)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(width: 8),

                        // KATEGORI
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F8F2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.restaurant,
                                size: 14,
                                color: Color(0xFF18A77A),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Western • Bistro',
                                style: TextStyle(
                                  color: Color(0xFF18A77A),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // =====================================
                    // ALAMAT
                    // =====================================
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Jl. Kemang Raya No.45, Jakarta Selatan',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // =====================================
                    // STATISTIK
                    // =====================================
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFA),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      child: Row(
                        children: [

                          // JARAK
                          const Expanded(
                            child: StatisticItem(
                              icon: Icons.near_me,
                              value: '2.5 km',
                              label: 'Jarak',
                            ),
                          ),

                          // PEMBATAS
                          Container(
                            height: 40,
                            width: 1,
                            color: Colors.grey.shade300,
                          ),

                          // WAKTU BUKA
                          const Expanded(
                            child: StatisticItem(
                              icon: Icons.access_time,
                              value: '10.00 - 22.00',
                              label: 'Waktu Buka',
                            ),
                          ),

                          // PEMBATAS
                          Container(
                            height: 40,
                            width: 1,
                            color: Colors.grey.shade300,
                          ),

                          // HARGA
                          const Expanded(
                            child: StatisticItem(
                              icon: Icons.payments_outlined,
                              value: 'Rp 100.000',
                              label: 'Harga Rata-rata',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 22),

                    // =====================================
                    // DESKRIPSI
                    // =====================================
                    const Text(
                      'Tentang Restoran',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'La Brasserie Bistro menghadirkan pengalaman bersantap '
                      'dengan cita rasa khas Eropa dalam suasana yang hangat '
                      'dan elegan. Menggunakan bahan-bahan segar pilihan dan '
                      'racikan chef berpengalaman untuk setiap hidangan '
                      'istimewa.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // SELENGKAPNYA
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Selengkapnya ›',
                        style: TextStyle(
                          color: Color(0xFF18A77A),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // =====================================
                    // MENU POPULER
                    // =====================================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Menu Populer',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Lihat Semua ›',
                            style: TextStyle(
                              color: Color(0xFF18A77A),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // =====================================
                    // 3 CARD MENU
                    // =====================================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // MENU 1
                        Expanded(
                          child: MenuCard(
                            imageUrl:
                                'https://images.unsplash.com/photo-1544025162-d76694265947'
                                '?auto=format&fit=crop&w=500&q=80',
                            name: 'Grilled Sirloin Steak',
                            price: 'Rp 145.000',
                          ),
                        ),

                        const SizedBox(width: 8),

                        // MENU 2
                        Expanded(
                          child: MenuCard(
                            imageUrl:
                                'https://images.unsplash.com/photo-1551183053-bf91a1d81141'
                                '?auto=format&fit=crop&w=500&q=80',
                            name: 'Truffle Carbonara',
                            price: 'Rp 98.000',
                          ),
                        ),

                        const SizedBox(width: 8),

                        // MENU 3
                        Expanded(
                          child: MenuCard(
                            imageUrl:
                                'https://images.unsplash.com/photo-1467003909585-2f8a72700288'
                                '?auto=format&fit=crop&w=500&q=80',
                            name: 'Grilled Salmon',
                            price: 'Rp 128.000',
                          ),
                        ),
                      ],
                    ),

                    // Jarak agar FAB tidak menutupi menu
                    const SizedBox(height: 90),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// WIDGET STATISTIK
// ============================================================

class StatisticItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatisticItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xFF18A77A),
          size: 18,
        ),

        const SizedBox(height: 6),

        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),

        const SizedBox(height: 3),

        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 9,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// WIDGET CARD MENU
// ============================================================

class MenuCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const MenuCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // =====================================
          // GAMBAR MAKANAN
          // =====================================
          Stack(
            children: [
              SizedBox(
                height: 95,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(
                          Icons.fastfood,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),

              // ICON FAVORITE
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),

          // =====================================
          // NAMA + HARGA
          // =====================================
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF18A77A),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}