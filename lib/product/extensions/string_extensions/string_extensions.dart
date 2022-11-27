// Eğer bize bir service den color dönerlerse ki bu string olarak gelecektir.
// Biz bunu bu şekilde yönetmeliyiz. Çünkü birden fazla servicede color parametresi ile birlikte gelebilir.
extension ColorStringExtension on String? {
  int get colorValue {
    var newColor = this?.replaceFirst('#', '0xff') ?? '';
    return int.parse(newColor);
  }
}
