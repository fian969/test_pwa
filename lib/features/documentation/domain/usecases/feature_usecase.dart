import 'package:flutter_setup_clean_architectute/features/documentation/data/repositories/documentation_repository.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';

class GetAllFeaturesUseCase {
  final DocumentationRepository repository;

  GetAllFeaturesUseCase(this.repository);

  Future<List<FeatureEntity>> call() async {
    return await repository.getAllFeatures();
  }
}

class GetFeatureByCategoryUseCase {
  final DocumentationRepository repository;

  GetFeatureByCategoryUseCase(this.repository);

  Future<List<FeatureEntity>> call(String category) async {
    return await repository.getFeaturesByCategory(category);
  }
}
