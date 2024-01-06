import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/app/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class EPicture extends StatefulWidget {
  final String? path;
  final BoxFit fit;
  final double borderRadius;
  final AlignmentGeometry alignment;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final VoidCallback? onError;

  const EPicture({
    required this.path,
    super.key,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
    this.alignment = Alignment.center,
    this.width = 100,
    this.height = 100,
    this.onTap,
    this.onError,
  });

  @override
  State<EPicture> createState() => _EPictureState();
}

class _EPictureState extends State<EPicture> {
  bool loading = true;
  bool error = false;
  ImageProvider? image;
  String? oldPath;

  @override
  void initState() {
    oldPath = widget.path;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (oldPath != widget.path) {
      oldPath = widget.path;
      image = null;
      error = false;
    }
    if (image == null && !error && widget.path != null) {
      loading = true;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await DefaultCacheManager().getSingleFile(widget.path!).then((value) {
          image = FileImage(value);
        }).catchError((e, s) {
          error = true;
          widget.onError?.call();
        }).whenComplete(() {
          loading = false;
          if (mounted) {
            setState(() {});
          }
        });
      });
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (error || image == null) _error(),
              if ((loading || image == null) && widget.path != null && !error)
                _Shimmer(
                  width: widget.width,
                  height: widget.height,
                ),
              if (image != null)
                Image(
                  width: widget.width,
                  height: widget.height,
                  fit: widget.fit,
                  alignment: widget.alignment,
                  image: image!,
                  errorBuilder: (context, error, stackTrace) {
                    widget.onError?.call();
                    return _error();
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return _Shimmer(
                      height: widget.height,
                      width: widget.width,
                      child: child,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _error() {
    final size = Size(widget.width, widget.height);
    return Container(
      color: EColor.grey,
      width: size.width,
      height: size.height,
      child: Padding(
        padding: EdgeInsets.all(size.shortestSide * 0.20),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 40.w,
              maxHeight: 40.w,
            ),
            child: FittedBox(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: EColor.silver,
                size: size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Shimmer extends StatelessWidget {
  final Widget? child;
  final double width;
  final double height;

  const _Shimmer({
    required this.width,
    required this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: EColor.silver,
      highlightColor: EColor.white,
      child: Container(
        color: EColor.white,
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
