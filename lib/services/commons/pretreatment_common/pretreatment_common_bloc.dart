// ignore: depend_on_referenced_packages
import "package:bloc/bloc.dart";
import "package:com_noopeshop_backend/exceptions/standard_exception.dart";
import "package:com_noopeshop_backend/repositories/upload_repository.dart";
import "package:com_noopeshop_backend/utils/abstract_treatment.dart";
import "package:com_noopeshop_backend/utils/pretreatment.dart";
import "package:equatable/equatable.dart";

part "pretreatment_common_event.dart";
part "pretreatment_common_state.dart";

class PretreatmentCommonBloc
    extends Bloc<PretreatmentCommonEvent, PretreatmentCommonState> {
  late UploadRepository uploadRepository;
  late PreTreatment preTreatment;

  PretreatmentCommonBloc(
    this.uploadRepository,
    this.preTreatment,
  ) : super(PretreatmentCommonInitialState()) {
    on<OnPretreatmentCommonEvent>((event, emit) async {
      emit(PretreatmentCommonLoadingState());

      final Map<String, dynamic> data = {};

      try {
        for (String key in event.data.keys) {
          // On ne prend pas en compte les champs qui ne sont pas vide
          if (event.data[key].isNotEmpty) {
            data[key] = event.data[key]["value"];

            if (event.data[key]["pretreatment"].isNotEmpty &&
                event.data[key]["value"].isNotEmpty) {
              for (String treatmentName in event.data[key]["pretreatment"]) {
                AbstractTreatment treatment = preTreatment.get(treatmentName);

                dynamic value = await treatment.apply(event.data[key]["value"]);

                data[key] = value;
              }
            }
          }
        }

        emit(PretreatmentCommonLoadedState(
          data: data,
        ));
      } on StandardException catch (e) {
        emit(PretreatmentCommonFailureState(
          code: e.code,
        ));
      }
    });
  }
}
