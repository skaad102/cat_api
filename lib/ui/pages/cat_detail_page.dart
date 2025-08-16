import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';
import 'package:app_cat_pragma/ui/controllers/cats_controller.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CatDetailPage extends StatefulWidget {
  final String catId;

  const CatDetailPage({super.key, required this.catId});

  @override
  State<CatDetailPage> createState() => _CatDetailPageState();
}

class _CatDetailPageState extends State<CatDetailPage> {
  final controller = CatsController.instance;
  late CatsBreeds cat;

  @override
  void initState() {
    super.initState();
    cat = controller.getCatById(widget.catId);
    controller.getImageCatById(widget.catId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cat Detail - ${widget.catId}'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              // Cambiar luego por la foto del gato con un carousel
              child: Image.network(
                cat.image?.url ?? '',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Name: ${cat.name}'),
                  ),
                  ListTile(
                    title: Text('Origin: ${cat.origin}'),
                  ),
                  ListTile(
                    title: Text('Description: ${cat.description}'),
                  ),
                  ListTile(
                    title: Text('Temperament: ${cat.temperament}'),
                  ),
                  ListTile(
                    title: Text('Weight: ${cat.weight.metric} kg'),
                  ),
                  ListTile(
                    title: Text('Life Span: ${cat.lifeSpan} years'),
                  ),
                  ListTile(
                    title: Text('Wiki'),
                    onTap: () {
                      if (cat.wikipediaUrl?.isNotEmpty ?? false) {
                        // Abrir el enlace de Wikipedia
                        launchUrl(Uri.parse(cat.wikipediaUrl!));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('No Wikipedia link available')),
                        );
                      }
                    },
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
