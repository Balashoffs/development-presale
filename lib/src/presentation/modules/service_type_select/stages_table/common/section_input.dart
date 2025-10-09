import 'package:presale/src/domain/models/v1/section/section.dart';
import 'package:flutter/material.dart';
import 'package:presale/src/domain/models/v1/service_stage/service_stage.dart';


class SectionInput extends StatelessWidget {
  final Section? initial;
  final Function(Section section)? onChanged;
  final bool blank;
  final ServiceStage stage;

  const SectionInput({
    super.key,
    this.initial,
    this.onChanged,
    this.blank = false,
    required this.stage
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox();

  }
}
