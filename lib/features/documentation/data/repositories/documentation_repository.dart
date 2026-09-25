import 'package:flutter_setup_clean_architectute/features/documentation/data/datasources/local_documentation_datasource.dart';
import 'package:flutter_setup_clean_architectute/features/documentation/domain/entities/feature_entity.dart';

abstract class DocumentationRepository {
  Future<List<FeatureEntity>> getAllFeatures();
  Future<FeatureEntity?> getFeatureById(String id);
  Future<List<FeatureEntity>> getFeaturesByCategory(String category);
}

class DocumentationRepositoryImpl implements DocumentationRepository {
  final LocalDocumentationDatasource datasource;

  DocumentationRepositoryImpl(this.datasource);

  @override
  Future<List<FeatureEntity>> getAllFeatures() async {
    final features = await datasource.getAllFeatures();
    return features.cast<FeatureEntity>();
  }

  @override
  Future<FeatureEntity?> getFeatureById(String id) async {
    return await datasource.getFeatureById(id);
  }

  @override
  Future<List<FeatureEntity>> getFeaturesByCategory(String category) async {
    final features = await datasource.getFeaturesByCategory(category);
    return features.cast<FeatureEntity>();
  }
}
