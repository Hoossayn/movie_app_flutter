part of '../presentation.dart';

class MoviesListView extends StatelessWidget {
   MoviesListView({
    required this.future,
    Key? key,
    required this.headlineText,
  }) : super(key: key);

  final String headlineText;
  final Future<MovieModel> future;
  final theme = FlavourConfig.instance.config.theme;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MovieModel>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data?.results;
          return Padding(
            padding: const EdgeInsets.all(AppValues.padding15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headlineText,
                  style: theme.title1.copyWith(
                      color: theme.getWhiteTextColor()
                  ),
                ),
                const SizedBox(
                  height: AppValues.height20,
                ),
                SizedBox(
                  height: AppValues.height310,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppValues.padding3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(AppValues.radius20),
                                child: Image.network(
                                  '$imageUrl${data[index].posterPath}',
                                  height: AppValues.height240,
                                  width: AppValues.width170,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: AppValues.height240,
                                      width: AppValues.width170,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: AppValues.height15,
                            ),
                            Container(
                              width: AppValues.width170,
                              height: AppValues.height50,
                              margin: const EdgeInsets.only(left: AppValues.padding5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data[index].title ?? data[index].name!,
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.bodyMediumTextStyle.copyWith(
                                        color: theme.getWhiteTextColor()
                                      ),
                                  ),
                                  Text(
                                    data[index].genreIds!.isNotEmpty
                                        ? getGenres(data[index].genreIds!)
                                        : '',
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.bodyMediumTextStyle.copyWith(
                                        color: theme.getWhiteTextColor()
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
