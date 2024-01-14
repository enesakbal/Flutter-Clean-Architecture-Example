part of '../../view/movie_detail_view.dart';

class _TagContainer extends StatelessWidget {
  const _TagContainer(this.tag);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(tag, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white)),
    );
  }
}
