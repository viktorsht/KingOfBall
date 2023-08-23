import 'package:flutter/material.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/more/controller/more_controller.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/ranking/controllers/ranking_controller.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';
import 'package:rei_da_bola/design_system/widgets/card_ranking.dart';
import '../../../../../../design_system/widgets/widget_loading.dart';
import 'components/championship_round_page.dart';

class MorePage extends StatefulWidget {
  final int edition;
  const MorePage({super.key, required this.edition});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final controllerMore = MoreController();
  final rankingController = RankingController();
  final PageController _pageController = PageController(initialPage: 0);

  Future<void> fetchData() async {
    await controllerMore.initMore();
    await rankingController.initRanking(widget.edition);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ColorsAppDefault();
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: height,
                    child: Center(
                      child: WidgetLoading(
                        color: colors.green,
                        width: 6,
                        thickness: 1,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar os dados'), // Error message
                  );
                } else {
                  final rankingList = rankingController.rankingList;
                  return Column(
                    children: [
                      SizedBox(
                        height: height * .3,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: controllerMore.numRodadas,
                          itemBuilder: (context, index) {
                            return ChampionshipRoundPage(
                              round: index + 1,
                              listRound: controllerMore.listSoccerMatch,
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Top 3 equipes',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height,
                        child: ListView.builder(
                          itemCount: rankingList.length <= 3 ? rankingList.length : 3,
                          itemBuilder: (context, index) {
                            final element = rankingList[index].teamGameEdition;
                            if (element == null) {
                              return WidgetLoading(width: 5, thickness: 1, color: colors.green);
                            } else {
                              int textEnd = index + 1;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardRanking(
                                  color: colors,
                                  pathImage: ImagesApp.escudoTeam,
                                  titleText: element.teamGame!.name!,
                                  subTitleText: element.teamGame!.user!.nick!,
                                  subSubTitleText: rankingList[index].score!,
                                  textEnd: textEnd.toString(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
