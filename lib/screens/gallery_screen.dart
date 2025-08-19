import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de imagens do assets
    final List<String> imageAssets = [
      'imagens/images.jpeg',
      'imagens/download.jpeg',
      'imagens/images.jpeg',
      'imagens/download.jpeg',
      'imagens/images.jpeg',
      'imagens/download.jpeg',
      'imagens/images.jpeg',
      'imagens/download.jpeg',
      'imagens/images.jpeg',
      'imagens/download.jpeg',
      'imagens/images.jpeg',
      'imagens/download.jpeg',

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.0,
          ),
          itemCount: imageAssets.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageAssets[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
