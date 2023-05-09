import 'package:animate_do/animate_do.dart';
import 'package:catapp/controller/home/home_controller.dart';
import 'package:catapp/model/colors.dart';
import 'package:catapp/model/common.dart';
import 'package:catapp/model/home/breeds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cats Breeds'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Skeleton(
              skeleton: SkeletonListView(),
              isLoading: _.isLoading,
              child: ListView.builder(
                itemCount: _.myListBreeds.length,
                itemBuilder: (context, index) {
                  CatBreeds pokemon = _.myListBreeds[index];
                  return _buildCards(index + 1, pokemon, _);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCards(int index, CatBreeds catbreeds, HomeController _) {
    return InkWell(
      onTap: () {
        _.goToDetail(catbreeds.referenceImageId ?? '');
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Raza:  ${catbreeds.name}',
                style: Theme.of(Get.context!).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Image.network(
                  '${Common().baseUrlImageCats}${catbreeds.referenceImageId}.jpg',
                  height: 180,
                  fit: BoxFit.scaleDown,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Swing(
                      infinite: true,
                      child: Center(
                        heightFactor: 2,
                        child: Image.network(
                          Common().baseUrlLoadingCats,
                          color: CAColors.red,
                          width: 70,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Pais Origen: ${catbreeds.origin}',
                    style: Theme.of(Get.context!).textTheme.bodyText1,
                  ),
                  Text(
                    'Inteligencia: ${catbreeds.intelligence}',
                    style: Theme.of(Get.context!).textTheme.bodyText1,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
