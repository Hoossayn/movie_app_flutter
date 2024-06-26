part of '../presentation.dart';


class UpcomingMovies extends StatelessWidget {
   UpcomingMovies({required this.future, Key? key}) : super(key: key);
  final Future<MovieModel> future;
  final theme = FlavourConfig.instance.config.theme;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieModel>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.results.isNotEmpty ) {
          final data = snapshot.data?.results;
          return Column(
            children: [
              Text(
                context.localised.labelUpcomingMovies,
                style: theme.title1.copyWith(
                  color: theme.getWhiteTextColor()
                ),
              ),
              const SizedBox(
                height: AppValues.height10,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  viewportFraction: 0.5,
                  enlargeCenterPage: data!.length != 1,
                  aspectRatio: 1.5,
                ),
                itemCount: data.length,
                itemBuilder: (context, index, realIndex) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppValues.radius20),
                          child: Image.network(
                            '$imageUrl${data[index].posterPath}',
                            width: AppValues.width175,
                            height: AppValues.height250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(AppValues.radius20),
                            bottomRight: Radius.circular(AppValues.radius20)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: AppValues.height60,
                            width: AppValues.width175,
                            padding: const EdgeInsets.all(AppValues.padding10),
                            color: Colors.black26,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].title ?? data[index].name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.titleSmallTextStyle.copyWith(
                                    color: theme.getWhiteTextColor()
                                  ),
                                ),
                                Text(
                                  getGenres(data[index].genreIds!),
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.bodyMediumTextStyle.copyWith(
                                    color: theme.getWhiteTextColor()
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
