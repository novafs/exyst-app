import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailUpdatesEnabled = true;
  bool _darkModeEnabled = false;
  bool _downloadOverWifi = true;
  String _selectedLanguage = 'English';
  String _selectedVideoQuality = 'Auto';

  final List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Arabic',
  ];

  final List<String> _videoQualities = [
    'Auto',
    'Low (480p)',
    'Medium (720p)',
    'High (1080p)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSectionTitle('Account'),
            _buildSettingItem(
              'Profile Information',
              'Edit your personal information',
              Icons.person,
              () {
                Navigator.pushNamed(context, '/profile-information');
              },
            ),
            _buildSettingItem(
              'Change Password',
              'Update your password',
              Icons.lock,
              () {
                Navigator.pushNamed(context, '/change-password');
              },
            ),
            _buildSettingItem(
              'Linked Accounts',
              'Manage connected social accounts',
              Icons.link,
              () {
                Navigator.pushNamed(context, '/linked-accounts');
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Notifications'),
            _buildSwitchItem(
              'Push Notifications',
              'Receive notifications on your device',
              Icons.notifications,
              _notificationsEnabled,
              (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            _buildSwitchItem(
              'Email Updates',
              'Receive course updates via email',
              Icons.email,
              _emailUpdatesEnabled,
              (value) {
                setState(() {
                  _emailUpdatesEnabled = value;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Appearance'),
            _buildSwitchItem(
              'Dark Mode',
              'Switch between light and dark themes',
              Icons.dark_mode,
              _darkModeEnabled,
              (value) {
                Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme();
                setState(() {
                  _darkModeEnabled = value;
                });
              },
            ),
            _buildDropdownItem(
              'Language',
              'Choose your preferred language',
              Icons.language,
              _selectedLanguage,
              _languages,
              (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('Content'),
            _buildDropdownItem(
              'Video Quality',
              'Set default video playback quality',
              Icons.high_quality,
              _selectedVideoQuality,
              _videoQualities,
              (value) {
                setState(() {
                  _selectedVideoQuality = value!;
                });
              },
            ),
            _buildSwitchItem(
              'Download Over Wi-Fi Only',
              'Save mobile data by downloading over Wi-Fi',
              Icons.wifi,
              _downloadOverWifi,
              (value) {
                setState(() {
                  _downloadOverWifi = value;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('About'),
            _buildSettingItem(
              'Terms of Service',
              'Read our terms and conditions',
              Icons.description,
              () {
                Navigator.pushNamed(context, '/terms-of-service');
              },
            ),
            _buildSettingItem(
              'Privacy Policy',
              'Read our privacy policy',
              Icons.privacy_tip,
              () {
                Navigator.pushNamed(context, '/privacy-policy');
              },
            ),
            _buildSettingItem(
              'App Version',
              'Version 1.0.0',
              Icons.info,
              () {},
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3251),
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF0A3251).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF0A3251)),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3251),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFF0A3251),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF0A3251).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF0A3251)),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3251),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF0A3251),
      ),
    );
  }

  Widget _buildDropdownItem(
    String title,
    String subtitle,
    IconData icon,
    String value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF0A3251).withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF0A3251)),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3251),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing: DropdownButton<String>(
        value: value,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: Color(0xFF0A3251)),
        underline: Container(height: 0),
        onChanged: onChanged,
        items:
            items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
      ),
    );
  }
}
