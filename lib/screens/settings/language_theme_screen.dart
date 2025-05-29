import 'package:flutter/material.dart';

class LanguageThemeScreen extends StatefulWidget {
  const LanguageThemeScreen({Key? key}) : super(key: key);

  @override
  State<LanguageThemeScreen> createState() => _LanguageThemeScreenState();
}

class _LanguageThemeScreenState extends State<LanguageThemeScreen> {
  String _selectedLanguage = 'English';
  String _selectedTheme = 'Light';
  String _selectedFontSize = 'Medium';

  final List<LanguageOption> _languages = [
    LanguageOption(name: 'English', code: 'en', flag: '🇺🇸'),
    LanguageOption(name: 'Spanish', code: 'es', flag: '🇪🇸'),
    LanguageOption(name: 'French', code: 'fr', flag: '🇫��'),
    LanguageOption(name: 'German', code: 'de', flag: '🇩🇪'),
    LanguageOption(name: 'Chinese', code: 'zh', flag: '🇨🇳'),
    LanguageOption(name: 'Japanese', code: 'ja', flag: '🇯🇵'),
    LanguageOption(name: 'Arabic', code: 'ar', flag: '🇸🇦'),
    LanguageOption(name: 'Russian', code: 'ru', flag: '🇷🇺'),
    LanguageOption(name: 'Portuguese', code: 'pt', flag: '🇵🇹'),
    LanguageOption(name: 'Hindi', code: 'hi', flag: '🇮🇳'),
  ];

  final List<ThemeOption> _themes = [
    ThemeOption(name: 'Light', color: Colors.white, icon: Icons.light_mode),
    ThemeOption(name: 'Dark', color: Colors.black87, icon: Icons.dark_mode),
    ThemeOption(name: 'Blue', color: Colors.blue[800]!, icon: Icons.color_lens),
    ThemeOption(
      name: 'Green',
      color: Colors.green[800]!,
      icon: Icons.color_lens,
    ),
    ThemeOption(
      name: 'Purple',
      color: Colors.purple[800]!,
      icon: Icons.color_lens,
    ),
  ];

  final List<String> _fontSizes = ['Small', 'Medium', 'Large', 'Extra Large'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language & Theme'),
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
            _buildSectionTitle('Language'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Choose your preferred language for the app interface',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _languages.length,
              itemBuilder: (context, index) {
                final language = _languages[index];
                return _buildLanguageItem(language);
              },
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Theme'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Choose your preferred app theme',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _themes.length,
                itemBuilder: (context, index) {
                  final theme = _themes[index];
                  return _buildThemeItem(theme);
                },
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Font Size'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Adjust the text size throughout the app',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children:
                    _fontSizes.map((size) => _buildFontSizeItem(size)).toList(),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Save settings and navigate back
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A3251),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Save Changes',
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
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0A3251),
        ),
      ),
    );
  }

  Widget _buildLanguageItem(LanguageOption language) {
    final isSelected = _selectedLanguage == language.name;

    return ListTile(
      leading: Text(language.flag, style: const TextStyle(fontSize: 24)),
      title: Text(
        language.name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: const Color(0xFF0A3251),
        ),
      ),
      subtitle: Text(
        'Code: ${language.code}',
        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
      ),
      trailing:
          isSelected
              ? const Icon(Icons.check_circle, color: Color(0xFF0A3251))
              : null,
      onTap: () {
        setState(() {
          _selectedLanguage = language.name;
        });
      },
    );
  }

  Widget _buildThemeItem(ThemeOption theme) {
    final isSelected = _selectedTheme == theme.name;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTheme = theme.name;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF0A3251) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              theme.icon,
              color: theme.name == 'Light' ? Colors.black : Colors.white,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              theme.name,
              style: TextStyle(
                color: theme.name == 'Light' ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color:
                    theme.name == 'Light'
                        ? const Color(0xFF0A3251)
                        : Colors.white,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFontSizeItem(String size) {
    final isSelected = _selectedFontSize == size;

    double fontSize;
    switch (size) {
      case 'Small':
        fontSize = 14;
        break;
      case 'Medium':
        fontSize = 16;
        break;
      case 'Large':
        fontSize = 18;
        break;
      case 'Extra Large':
        fontSize = 20;
        break;
      default:
        fontSize = 16;
    }

    return ListTile(
      title: Text(
        'Font Size: $size',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: const Color(0xFF0A3251),
        ),
      ),
      subtitle: Text(
        'This is how text will appear throughout the app',
        style: TextStyle(fontSize: fontSize - 2, color: Colors.grey[600]),
      ),
      trailing:
          isSelected
              ? const Icon(Icons.check_circle, color: Color(0xFF0A3251))
              : null,
      onTap: () {
        setState(() {
          _selectedFontSize = size;
        });
      },
    );
  }
}

class LanguageOption {
  final String name;
  final String code;
  final String flag;

  LanguageOption({required this.name, required this.code, required this.flag});
}

class ThemeOption {
  final String name;
  final Color color;
  final IconData icon;

  ThemeOption({required this.name, required this.color, required this.icon});
}
