import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rei_da_bola/app/modules/start_navigation_bar/modules/ranking/controllers/ranking_controller.dart';
import 'package:rei_da_bola/design_system/colors/colors_app.dart';
import 'package:rei_da_bola/design_system/images/images_app.dart';
import 'package:rei_da_bola/design_system/widgets/card_ranking.dart';
import '../../../../../../design_system/widgets/widget_loading.dart';
import 'components/general_league.dart';

class RankingPage extends StatefulWidget {
  final int edition;
  const RankingPage({super.key, required this.edition});

  @override
  State<RankingPage> createState() => _RankingPageState();
}
class _RankingPageState extends State<RankingPage> {
  final rankingController = RankingController();
  final colors = ColorsAppDefault();

  @override
  void initState() {
    super.initState();
    rankingController.initRanking(widget.edition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: GeneralLeague(
                colors: colors,
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ranking",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder(
                future: rankingController.initRanking(widget.edition),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: WidgetLoading(
                        color: colors.green,
                        width: 6,
                        thickness: 1,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Erro ao carregar os dados: ${snapshot.error}',
                      ),
                    );
                  } else {
                    return Observer(
                      builder: (context) {
                        return ListView.builder(
                          itemCount: rankingController.rankingList.length,
                          itemBuilder: (context, index) {
                            // Substitua esta parte pelo seu widget de CardRanking
                            int textEnd = index + 1;
                            final element = rankingController.rankingList[index].teamGameEdition;
                            return element == null
                            ? WidgetLoading(width: 5, thickness: 1, color: colors.green,)
                            : Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: CardRanking(
                                color: colors,
                                pathImage: ImagesApp.escudoTeam,
                                titleText: rankingController.rankingList[index].teamGameEdition!.teamGame!.name!,
                                subTitleText: rankingController.rankingList[index].teamGameEdition!.teamGame!.user!.nick!,
                                subSubTitleText: rankingController.rankingList[index].score!,
                                textEnd: textEnd.toString(),
                              ),
                            );
                          },
                        );
                      }
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
     