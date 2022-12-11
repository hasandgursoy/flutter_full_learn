part of './part_of_learn.dart';


class _PartOfBar extends StatelessWidget with PreferredSizeWidget {
  const _PartOfBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('a'),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded))
      ],
    );
  }

  // Appbar prefered size'ı aldığı için o da bir uzunluk değeri döndüğü için bunu override ediyoruz.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
