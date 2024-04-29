import 'package:flutter/material.dart';
import 'package:pfe/features/home/models/serveur_model.dart';

class ServeurCard extends StatelessWidget {
  final Serveur serveur;
  const ServeurCard({
    super.key,
    required this.serveur,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  Navigator.pushNamed(context, '/product_details', arguments: product);
      },
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/ServeurDetails',
                arguments: serveur,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),

              child: Image.network(serveur.imageURL,
                  fit: BoxFit.cover, width: 1000.0),
              // child: Text(serveur.name),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(serveur.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600)),
                  Flexible(
                    child: Text(serveur.price.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
