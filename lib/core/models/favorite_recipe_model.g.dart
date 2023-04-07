// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteRecipeModelAdapter extends TypeAdapter<FavoriteRecipeModel> {
  @override
  final int typeId = 1;

  @override
  FavoriteRecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteRecipeModel(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteRecipeModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.recipeId)
      ..writeByte(1)
      ..write(obj.recipeName)
      ..writeByte(2)
      ..write(obj.recipeImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteRecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
