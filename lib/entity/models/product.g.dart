// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 1;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      barcode: fields[1] as String?,
      brand: fields[2] as String?,
      category: fields[3] as String,
      color: fields[4] as String?,
      date: fields[5] as String,
      description: fields[6] as String?,
      discountAmount: fields[7] as double?,
      discountPercentage: fields[8] as double?,
      gender: fields[9] as String?,
      isSale: fields[11] as bool,
      isNew: fields[10] as bool,
      location: fields[12] as String,
      name: fields[13] as String,
      newPrice: fields[14] as double?,
      photo1: fields[15] as String?,
      photo2: fields[16] as String?,
      photo3: fields[17] as String?,
      photo4: fields[18] as String?,
      pk: fields[0] as int,
      price: fields[19] as double,
      productId: fields[20] as String,
      vendorName: fields[21] as String,
      size: fields[22] as String?,
      subCategory: fields[23] as String,
      superCategory: fields[24] as String,
      url: fields[25] as String?,
      visited: fields[26] as int,
      freeDelivery: fields[29] == null ? false : fields[29] as bool?,
      selectedQuantity: fields[27] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.pk)
      ..writeByte(1)
      ..write(obj.barcode)
      ..writeByte(2)
      ..write(obj.brand)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.color)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.discountAmount)
      ..writeByte(8)
      ..write(obj.discountPercentage)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.isNew)
      ..writeByte(11)
      ..write(obj.isSale)
      ..writeByte(12)
      ..write(obj.location)
      ..writeByte(13)
      ..write(obj.name)
      ..writeByte(14)
      ..write(obj.newPrice)
      ..writeByte(15)
      ..write(obj.photo1)
      ..writeByte(16)
      ..write(obj.photo2)
      ..writeByte(17)
      ..write(obj.photo3)
      ..writeByte(18)
      ..write(obj.photo4)
      ..writeByte(19)
      ..write(obj.price)
      ..writeByte(20)
      ..write(obj.productId)
      ..writeByte(21)
      ..write(obj.vendorName)
      ..writeByte(22)
      ..write(obj.size)
      ..writeByte(23)
      ..write(obj.subCategory)
      ..writeByte(24)
      ..write(obj.superCategory)
      ..writeByte(25)
      ..write(obj.url)
      ..writeByte(26)
      ..write(obj.visited)
      ..writeByte(29)
      ..write(obj.freeDelivery)
      ..writeByte(27)
      ..write(obj.selectedQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
