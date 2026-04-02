import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/data/helpers/file_picker/file_picker.dart';
import 'package:presale/src/domain/models/common/metadata_for_picking.dart';
import 'package:presale/src/presentation/bloc/v6/design/offer_preview/offer_preview_cubit.dart';
import 'package:presale/src/presentation/modules/v5/design/common/custom_app_bar.dart';
import 'package:presale/src/presentation/modules/v5/design/common/next_page_widget.dart';
import 'package:presale/src/presentation/modules/v5/design/navi/service_navi.dart';

class OfferPreviewPage extends StatelessWidget {
  const OfferPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(child: OfferPreviewCubitProvider());
  }
}

class OfferPreviewCubitProvider extends StatelessWidget {
  const OfferPreviewCubitProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OfferPreviewCubit(di),
      child: DesignOfferPreviewRootWidget(),
    );
  }
}

class DesignOfferPreviewRootWidget extends StatelessWidget {
  const DesignOfferPreviewRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OfferPreviewCubit>();
    print(cubit.state);
    return BlocConsumer<OfferPreviewCubit, OfferPreviewState>(
      listener: (context, state) {
        state.whenOrNull(
          picked: () {
            context.go(designInputRoute);
          },
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(flex: 9, child: Center(child: Text('Загрузить/Создать'))),
            Expanded(
              flex: 1,
              child: Row(
                spacing: 16.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonWidget(
                    text: '  Назад  ',
                    onTap: () {
                      cubit.clear();
                      context.pop();
                    },
                  ),
                  CustomButtonWidget(
                    text: 'Загрузить',
                    onTap: () async {
                      final metadata = await pickFile(MetadataForPiking());
                      cubit.process(metadata);
                    },
                  ),
                  CustomButtonWidget(
                    text: 'Создать',
                    onTap: () {
                      context.go(designInputRoute);
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
