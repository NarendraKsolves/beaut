import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("Today"),
            _buildNotificationItem(
              icon: Icons.calendar_today_outlined,
              iconColor: const Color(0xFFA50021),
              title: "Appointment is confirmed",
              subtitle: "Your appointment with Beauty Bar is on Friday at 1pm.",
              time: "1h",
            ),
            _buildNotificationItem(
              icon: Icons.favorite_border,
              iconColor: const Color(0xFFA50021),
              title: "Beaut.ai's Pick for You",
              subtitle: "Beaut.ai recommends the new Rhode balm. Check it out.",
              time: "1h",
            ),
            _buildNotificationItem(
              icon: Icons.percent_outlined,
              iconColor: const Color(0xFFF8F8F8),
              iconIconColor: Colors.black87,
              title: "You've earned 150 points",
              subtitle: "Redeem them for exclusive rewards.",
              time: "2h",
            ),
            const SizedBox(height: 16),
            _buildSectionHeader("This week"),
            _buildNotificationItem(
              icon: Icons.calendar_today_outlined,
              iconColor: const Color(0xFFF8F8F8),
              iconIconColor: Colors.black87,
              title: "Appointment Reminder",
              subtitle: "Just a reminder: Your beauty session is tomorrow at 3 PM.",
              time: "1d",
            ),
            _buildNotificationItem(
              icon: Icons.play_arrow_outlined,
              iconColor: const Color(0xFFF8F8F8),
              iconIconColor: Colors.black87,
              title: "New Tutorial Alert",
              subtitle: "Learn how to achieve the perfect winged eyeliner.",
              time: "3d",
            ),
            _buildNotificationItem(
              icon: Icons.mail_outline,
              iconColor: const Color(0xFFF8F8F8),
              iconIconColor: Colors.black87,
              title: "Exclusive Invite",
              subtitle: "You're invited to our VIP beauty event this weekend.",
              time: "3d",
            ),
            _buildNotificationItem(
              icon: Icons.insights_outlined,
              iconColor: const Color(0xFFF8F8F8),
              iconIconColor: Colors.black87,
              title: "Skin Analysis Update",
              subtitle: "Your recent scan shows improvement in hydration levels.",
              time: "5d",
            ),
            const SizedBox(height: 16),
            _buildSectionHeader("Last week"),
            _buildNotificationItem(
              icon: Icons.person_add_outlined,
              iconColor: const Color(0xFFF8F8F8),
              iconIconColor: Colors.black87,
              title: "Friend Joined Beaut.ai",
              subtitle: "Juliana Mejia just joined Beaut.ai. Connect now.",
              time: "1w",
            ),
            _buildNotificationItem(
              icon: Icons.card_giftcard_outlined,
              iconColor: const Color(0xFFF8F8F8),
              iconIconColor: Colors.black87,
              title: "Birthday Treat Just for You!",
              subtitle: "It's your special day! Enjoy 20% off your next booking.",
              time: "1w",
            ),
            _buildNotificationItem(
              icon: Icons.event_note_outlined,
              iconColor: const Color(0xFFF8F8F8),
              iconIconColor: Colors.black87,
              title: "Appointment Rescheduled",
              subtitle: "Your appointment with Beauty Bay is now next Monday.",
              time: "1w",
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    Color iconIconColor = Colors.white,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconIconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
