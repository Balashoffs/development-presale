import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presale/src/di/di.dart';
import 'package:presale/src/domain/models/common/metadata_for_picking.dart';
import 'package:presale/src/domain/repository/v5/design/input_data_repository.dart';
import 'package:presale/src/domain/service/v6/design/encrypt_json_to_bytes.dart';
import 'package:presale/src/domain/service/v6/design/encrypt_shared_design_offer.dart';

part 'offer_preview_state.dart';

part 'offer_preview_cubit.freezed.dart';

class OfferPreviewCubit extends Cubit<OfferPreviewState> {
  final ObjectRepository _objectRepository;
  late final EncryptShareDesignOfferService? _shareDesignOfferService;

  OfferPreviewCubit(DependencyInjector di)
    : _objectRepository = ObjectRepository(di),
      super(const OfferPreviewState.initial()) {
    _init();
  }

  void _init() {
    final designPresalePojo = di.dartDefineModel;
    int key = stringToInt(designPresalePojo.user);
    _shareDesignOfferService = EncryptShareDesignOfferService(
      key,
    );
    emit(OfferPreviewState.show());
  }

  void process(MetadataAfterPiking metadata) {
    emit(OfferPreviewState.initial());
    if (metadata.bytes.isNotEmpty) {
      _shareDesignOfferService?.decrypt(metadata.bytes).then((value) {
        value.fold((l) {}, (r) {
          _objectRepository.update(r.designPresale);
          emit(OfferPreviewState.picked());
        },);
      },);
    }
  }

  void clear() {
    _objectRepository.clearCashed();
  }
}
