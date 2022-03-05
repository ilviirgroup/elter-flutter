import 'package:bloc/bloc.dart';
import 'package:elter/entity/models.dart';
import 'package:elter/entity/repos.dart';
import 'package:equatable/equatable.dart';

part 'ads_product_state.dart';

class AdsProductCubit extends Cubit<AdsProductState> {
  final ProductRepository productRepository;
  AdsProductCubit(this.productRepository) : super(AdsProductInitial());

  void fetchAdsProduct(Ads adsObject) {
    if (adsObject.name.isNotEmpty) {
      productRepository.fetchAdsProducts(adsObject.name).then((products) {
        emit(
          AdsProductLoaded(products),
        );
      });
    }
  }

  void initializeAdsProductCubit() {
    emit(
      AdsProductInitial(),
    );
  }
}
