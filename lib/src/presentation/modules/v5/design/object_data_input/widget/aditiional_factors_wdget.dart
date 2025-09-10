// import 'package:flutter/material.dart';
// import 'package:moon_design/moon_design.dart';
// import 'package:presale/src/domain/models/v2/constructing/model/input/input_repository.dart';
// import 'package:presale/src/presentation/modules/v5/design/common/opacity_widget.dart';
// import 'package:presale/src/presentation/modules/v5/design/object_data_input/widget/drop_down_factors_controller.dart';
// import 'package:presale/src/presentation/modules/v5/design/object_data_input/widget/drop_down_factors_widgets.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../../bloc/v5/design/input/object_input_data/object_input_data_cubit.dart';
//
// class AdditionalFactorsWidget extends StatelessWidget {
//   const AdditionalFactorsWidget({super.key, required this.factors});
//
//   final InputFactorsViewModel factors;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return OpacityWidget(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         spacing: 8.0,
//         children: [
//           Column(
//             children: [
//               ChangeNotifierProvider(
//                 create: (context) =>
//                     SingleObjectValueNotifierDropDown(
//                       baseFactors: factors.factorsByType(
//                         InputFactorType.b.value,
//                       ),
//                     ),
//                 child: InputFactorMoonDropDown(
//                   onSelected: cubit.setHeightFactor,
//                   helperText: InputFactorType.b.value,
//                   leadingIcon:
//                   MoonIcons.arrows_left_curved_24_light,
//                 ),
//               ),
//               ChangeNotifierProvider(
//                 create: (context) =>
//                     MultiObjectValueNotifierDropDown(
//                       inputData: factors.complexities,
//                     ),
//                 child: InputFactorMultiCustomMoonDropDown(
//                   onSelected: cubit.setComplexityFactor,
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ChangeNotifierProvider(
//                 create: (context) =>
//                     SingleObjectValueNotifierDropDown(
//                       baseFactors: factors.factorsByType(
//                         InputFactorType.c.value,
//                       ),
//                     ),
//                 child: InputFactorMoonDropDown(
//                   onSelected: cubit.setLocationFactor,
//                   helperText: InputFactorType.c.value,
//                   leadingIcon:
//                   MoonIcons.arrows_left_curved_24_light,
//                 ),
//               ),
//               ChangeNotifierProvider(
//                 create: (context) =>
//                     SingleObjectValueNotifierDropDown(
//                       baseFactors: factors.factorsByType(
//                         InputFactorType.d.value,
//                       ),
//                     ),
//                 child: InputFactorMoonDropDown(
//                   onSelected: cubit.setSquareFactor,
//                   helperText: InputFactorType.d.value,
//                   leadingIcon:
//                   MoonIcons.arrows_left_curved_24_light,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
