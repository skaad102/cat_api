import 'dart:developer';

import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';
import 'package:app_cat_pragma/ui/controllers/cats_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CatImageCarousel extends StatelessWidget {
  final CatsBreeds cat;

  const CatImageCarousel({
    super.key,
    required this.cat,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CatsController.instance;

    return Obx(() {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: controller.catsImage.isEmpty
            ? _buildSingleImage(context)
            : _buildCarousel(context, controller),
      );
    });
  }

  Widget _buildSingleImage(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageDialog(context, cat.image?.url ?? ''),
      child: Image.network(
        cat.image?.url ?? '',
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        errorBuilder: (context, error, stackTrace) => const Center(
          child: Text('Error loading image'),
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, CatsController controller) {
    return CarouselView(
      onTap: (index) {
        log('Tapped on carousel image at index: $index');
        if (index < controller.catsImage.length) {
          final imageUrl = controller.catsImage[index].url;
          _showImageDialog(context, imageUrl);
        }
      },
      itemExtent: MediaQuery.of(context).size.width * 0.8,
      children: controller.catsImage
          .map((image) => _buildCarouselImage(context, image))
          .toList(),
    );
  }

  Widget _buildCarouselImage(BuildContext context, CatsImage image) {
    return Image.network(
      image.url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorBuilder: (context, error, stackTrace) => const Center(
        child: Text('Error loading image'),
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    log('Showing image dialog for: $imageUrl');
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.black,
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(
                      child: Text(
                        'Error loading image',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              // Botón de cerrar
              Positioned(
                top: 50,
                right: 20,
                child: SafeArea(
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
