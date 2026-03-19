import 'package:flutter/material.dart';
import 'package:beaut/notifications_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_outlined, color: Colors.black, size: 28),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                    );
                  },
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFFA50021),
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      "8",
                      style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withOpacity(0.05)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 16, fontWeight: FontWeight.w500),
                  prefixIcon: Icon(Icons.search, color: Colors.black38, size: 24),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            _buildProfileCard(),
            const SizedBox(height: 24),
            _buildMenuSection([
              _MenuItem(Icons.favorite_border, "Wishlist"),
              _MenuItem(Icons.star_border, "Exclusive Content"),
              _MenuItem(Icons.person_add_outlined, "Refer a friend"),
            ]),
            const SizedBox(height: 12),
            _buildMenuSection([
              _MenuItem(Icons.nights_stay_outlined, "Skin Profile"),
              _MenuItem(Icons.settings_outlined, "Product Preferences"),
              _MenuItem(Icons.history, "Interaction History"),
              _MenuItem(Icons.send_outlined, "Feedback"),
            ]),
            const SizedBox(height: 12),
            _buildMenuSection([
              _MenuItem(Icons.people_outline, "Family Sharing"),
              _MenuItem(Icons.calendar_today_outlined, "Shared Bookings"),
              _MenuItem(Icons.card_giftcard_outlined, "Gift Preferences"),
            ]),
            const SizedBox(height: 12),
            _buildMenuSection([
              _MenuItem(Icons.login_outlined, "Login Activity"),
              _MenuItem(Icons.lock_outline, "App Lock"),
            ]),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.03)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(
                  color: Color(0xFFC1E1C1),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=200&auto=format&fit=crop"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Ruby Thompson",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'Outfit'),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Beaut.ai account, skin profile, and more",
                      style: TextStyle(fontSize: 13, color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward, color: Colors.black26, size: 20),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildAvatarStack(),
              const SizedBox(width: 12),
              const Text(
                "Beauty Circle",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarStack() {
    return SizedBox(
      width: 60,
      height: 24,
      child: Stack(
        children: [
          _buildSmallAvatar(0, "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100"),
          _buildSmallAvatar(12, "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100"),
          _buildSmallAvatar(24, "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100"),
        ],
      ),
    );
  }

  Widget _buildSmallAvatar(double left, String url) {
    return Positioned(
      left: left,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _buildMenuSection(List<_MenuItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Column(
            children: [
              ListTile(
                leading: Icon(item.icon, color: Colors.black87, size: 24),
                title: Text(
                  item.title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.black26, size: 20),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                onTap: () {},
              ),
              if (index < items.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(height: 4, color: Colors.black.withOpacity(0.05)),
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String title;

  _MenuItem(this.icon, this.title);
}
