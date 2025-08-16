import 'package:app_cat_pragma/domain/entity/cats_breeds.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardCat extends StatefulWidget {
  const CardCat({super.key, required this.breeds});
  final CatsBreeds breeds;

  @override
  State<CardCat> createState() => _CardCatState();
}

class _CardCatState extends State<CardCat> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Theme.of(context).colorScheme.onPrimary,
          width: 1.0,
        ),
      ),
      margin: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.breeds.image?.url.isNotEmpty ?? false)
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Image.network(
                  widget.breeds.image!.url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    widget.breeds.name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    widget.breeds.origin,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.breeds.description.length < 100
                  ? Text(widget.breeds.description)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isExpanded
                              ? widget.breeds.description
                              : '${widget.breeds.description.substring(0, 100)}...',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Text(isExpanded ? 'Show less' : 'Show more'),
                          ),
                        ),
                      ],
                    ),
            ),
            Visibility(
              visible: widget.breeds.wikipediaUrl != null,
              child: TextButton(
                onPressed: () {
                  final Uri url = Uri.parse(widget.breeds.wikipediaUrl!);
                  launchUrl(url);
                },
                child: const Text("Wiki"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
