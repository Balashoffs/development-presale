import 'package:presale/src/domain/models/v1/section/section.dart';
import 'package:presale/src/presentation/common/typography_page_options.dart';
import 'package:flutter/material.dart';

class SectionsViewer extends StatefulWidget {
  final List<Section> sections;
  final VoidCallback onLoad;

  const SectionsViewer({
    super.key,
    required this.sections,
    required this.onLoad,
  });

  @override
  State<SectionsViewer> createState() => _SectionsViewerState();
}

class _SectionsViewerState extends State<SectionsViewer> {
  @override
  void initState() {
    super.initState();
    widget.onLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Text(
                          'Тип',
                          style: getBodyTextStyle(context, MoonTextSize.size14),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Text(
                          'Расшифровка',
                          style: getBodyTextStyle(context, MoonTextSize.size14),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Text(
                          'Шифр',
                          style: getBodyTextStyle(context, MoonTextSize.size14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Text(
                          'Соответствие направлению по штатке',
                          style: getBodyTextStyle(context, MoonTextSize.size14),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Text(
                          'Ставка в месяц',
                          style: getBodyTextStyle(context, MoonTextSize.size14),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Text(
                          'Ставка в день',
                          style: getBodyTextStyle(context, MoonTextSize.size14),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        child: Text(
                          'Ставка в час',
                          style: getBodyTextStyle(context, MoonTextSize.size14),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                itemCount: widget.sections.length,
                itemBuilder: (context, index) {
                  final section = widget.sections[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DecoratedBox(
                      decoration: BoxDecoration(border: Border()),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: Text(
                                section.stage.shortText,
                                style: getBodyTextStyle(
                                  context,
                                  MoonTextSize.size12,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 10,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: Text(
                                section.name,
                                style: getBodyTextStyle(
                                  context,
                                  MoonTextSize.size12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: Text(
                                section.shortName ?? '',
                                style: getBodyTextStyle(
                                  context,
                                  MoonTextSize.size12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: Text(
                                section.employee?.name ?? '',
                                style: getBodyTextStyle(
                                  context,
                                  MoonTextSize.size12,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: Text(
                                '₽',
                                style: getBodyTextStyle(
                                  context,
                                  MoonTextSize.size12,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: Text(
                                '₽',
                                style: getBodyTextStyle(
                                  context,
                                  MoonTextSize.size12,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 4,
                              ),
                              child: Text(
                                '₽',
                                style: getBodyTextStyle(
                                  context,
                                  MoonTextSize.size12,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
