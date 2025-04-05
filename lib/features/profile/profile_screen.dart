import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("PROFILE", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('assets/images/profile.png'), // Or use NetworkImage if available
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.displayName ?? "Anonymous",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    user?.email ?? "Email not found",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 12),
          const Text("General", style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 8),
          _buildListItem("Email"),
          _buildListItem("Name"),
          _buildListItem("Transaction History"),
          _buildListItem("Q & A"),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 12),
          const Text("Security", style: TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 8),
          _buildListItem("Terms and Policy"),
          _buildListItem("Security Policy"),
          const SizedBox(height: 12),
          ListTile(
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () => _logout(context),
          )
        ],
      ),
    );
  }

  Widget _buildListItem(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
