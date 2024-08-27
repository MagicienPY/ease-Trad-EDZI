import 'package:flutter/material.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de Bord'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.5, // Ratio pour les cartes
          ),
          itemCount: 6, // Nombre d'éléments dans le tableau de bord
          itemBuilder: (context, index) {
            return DashboardCard(
              title: _getCardTitle(index),
              icon: _getCardIcon(index),
              color: Colors.primaries[index % Colors.primaries.length], // Couleur aléatoire pour chaque carte
              onTap: () {
                // Action à effectuer lors du clic sur la carte
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _getDetailPage(index)),
                );
              },
            );
          },
        ),
      ),
    );
  }

  String _getCardTitle(int index) {
    switch (index) {
      case 0:
        return 'Traduction Audio';
      case 1:
        return 'Traduction Fichiers';
      case 2:
        return 'Traduction Images';
      case 3:
        return 'Traduction Vidéos';
      case 4:
        return 'Faire un Quiz';
      case 5:
        return 'Paramètres';
      default:
        return 'Option ${index + 1}';
    }
  }

  IconData _getCardIcon(int index) {
    switch (index) {
      case 0:
        return Icons.mic;
      case 1:
        return Icons.insert_drive_file;
      case 2:
        return Icons.image;
      case 3:
        return Icons.video_camera_front;
      case 4:
        return Icons.quiz;
      case 5:
        return Icons.settings;
      default:
        return Icons.help;
    }
  }

  Widget _getDetailPage(int index) {
    switch (index) {
      case 0:
        return const AudioTranslationPage();
      case 1:
        return const FileTranslationPage();
      case 2:
        return const ImageTranslationPage();
      case 3:
        return const VideoTranslationPage();
      case 4:
        return const QuizPage();
      case 5:
        return const SettingsPage();
      default:
        return const Center(child: Text('Page non définie'));
    }
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Exemple de pages pour chaque fonctionnalité
class AudioTranslationPage extends StatelessWidget {
  const AudioTranslationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Traduction Audio')),
      body: const Center(child: Text('Page de traduction audio')),
    );
  }
}

class FileTranslationPage extends StatelessWidget {
  const FileTranslationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Traduction Fichiers')),
      body: const Center(child: Text('Page de traduction de fichiers')),
    );
  }
}

class ImageTranslationPage extends StatelessWidget {
  const ImageTranslationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Traduction Images')),
      body: const Center(child: Text('Page de traduction d\'images')),
    );
  }
}

class VideoTranslationPage extends StatelessWidget {
  const VideoTranslationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Traduction Vidéos')),
      body: const Center(child: Text('Page de traduction de vidéos')),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Faire un Quiz')),
      body: const Center(child: Text('Page des quiz')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: const Center(child: Text('Page des paramètres')),
    );
  }
}
