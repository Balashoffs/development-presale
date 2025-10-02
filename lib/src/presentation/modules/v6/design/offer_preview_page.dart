import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';

class OfferPreviewPage extends StatelessWidget {
  const OfferPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(child: DesignOfferPreviewRootWidget());
  }
}

class DesignOfferPreviewRootWidget extends StatelessWidget {
  const DesignOfferPreviewRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 9, child: Center(child: Text('Загрузить/Создать'))),
        Expanded(
          flex: 1,
          child: Row(
            spacing: 16.0,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonWidget(text: '  Назад  ', onTap: context.pop),
              CustomButtonWidget(text: 'Загрузить', onTap: () {}),
              CustomButtonWidget(
                text: 'Создать',
                onTap: () {
                  context.push(designInputRoute);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
