import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quranapp/colorss.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'الملف الشخصي',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.amber),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.wb_sunny, color: Colors.amber),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // User Profile Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: primaryGreen),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('👤', style: TextStyle(fontSize: 30)),
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'المستخدم',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'مستخدم منذ 6 أشهر',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Menu Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildMenuItem(
                  icon: Icons.settings,
                  title: 'الإعدادات',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.notifications,
                  title: 'التنبيهات',
                  color: Colors.amber,
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.mobile_friendly,
                  title: 'مشاركة التطبيق',
                  color: Colors.blue,
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.star,
                  title: 'تقييم التطبيق',
                  color: Colors.amber,
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: 'المساعدة',
                  color: Colors.red,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.grey[600], size: 24),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// Main App
