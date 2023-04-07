// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HealthTypeAdapter extends TypeAdapter<HealthType> {
  @override
  final int typeId = 0;

  @override
  HealthType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HealthType.alcoholFree;
      case 1:
        return HealthType.eggFree;
      case 2:
        return HealthType.fishFree;
      case 3:
        return HealthType.glutenFree;
      case 4:
        return HealthType.lowSugar;
      case 5:
        return HealthType.noOilAdded;
      case 6:
        return HealthType.redMeatFree;
      case 7:
        return HealthType.soyFree;
      case 8:
        return HealthType.sugarFree;
      case 9:
        return HealthType.vegan;
      case 10:
        return HealthType.vegetarian;
      default:
        return HealthType.alcoholFree;
    }
  }

  @override
  void write(BinaryWriter writer, HealthType obj) {
    switch (obj) {
      case HealthType.alcoholFree:
        writer.writeByte(0);
        break;
      case HealthType.eggFree:
        writer.writeByte(1);
        break;
      case HealthType.fishFree:
        writer.writeByte(2);
        break;
      case HealthType.glutenFree:
        writer.writeByte(3);
        break;
      case HealthType.lowSugar:
        writer.writeByte(4);
        break;
      case HealthType.noOilAdded:
        writer.writeByte(5);
        break;
      case HealthType.redMeatFree:
        writer.writeByte(6);
        break;
      case HealthType.soyFree:
        writer.writeByte(7);
        break;
      case HealthType.sugarFree:
        writer.writeByte(8);
        break;
      case HealthType.vegan:
        writer.writeByte(9);
        break;
      case HealthType.vegetarian:
        writer.writeByte(10);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HealthTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
