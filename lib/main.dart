import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PersonalProfileApp(),
    );
  }
}

class PersonalProfileApp extends StatelessWidget {
  const PersonalProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Profile',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("assets/profile.jpeg"),
              ),
              SizedBox(height: 20),
              Text(
                'Mofolasayo Osikoya',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 15),
              SectionTitle(title: 'About'),
              SizedBox(height: 15),
              Text(
                'Passionate Flutter developer with a strong interest in creating beautiful, responsive, and user-friendly mobile apps. I enjoy building clean UI, solving complex problems, and continuously learning new technologies to improve my skills.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              SectionTitle(title: 'Skills'),
              SizedBox(height: 10),
              Wrap(
                spacing: 15,
                runSpacing: 12,
                children: [
                  Chip(label: Text("Flutter")),
                  Chip(label: Text("Dart")),
                  Chip(label: Text("Firebase")),
                  Chip(label: Text("REST APIs")),
                  Chip(label: Text("UI/UX")),
                  Chip(label: Text("Git")),
                ],
              ),
              SizedBox(height: 30),
              SectionTitle(title: 'Contact Information'),
              SizedBox(height: 10),
              ContactCard(
                icon: Icons.email,
                text: 'osikoyamofolasayo@gmail.com',
                url: 'mailto:osikoyamofolasayo@gmail.com',
              ),
              ContactCard(
                icon: Icons.phone,
                text: '+234 810 494 2229',
                url: 'tel:+2348104942229',
              ),
              ContactCard(
                icon: Icons.web,
                isSvg: true,
                text: 'Mofolasayo Osikoya',
                url:
                    'https://www.linkedin.com/in/mofolasayo-osikoya-b53a832a0/',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSvg;
  final String url;
  const ContactCard(
      {super.key,
      required this.icon,
      required this.text,
      required this.url,
      this.isSvg = false});

  Future<void> _launchUrl() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch Url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        onTap: _launchUrl,
        leading: isSvg
            ? SvgPicture.asset("assets/linkedIn.svg")
            : Icon(icon, color: Colors.white),
        title: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
