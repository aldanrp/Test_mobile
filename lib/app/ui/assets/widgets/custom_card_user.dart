import 'package:cached_network_image/cached_network_image.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/domains/entities/user.dart';

class CustomCardUser extends StatelessWidget {
  final Users users;
  final Function() onTap;
  final bool isSeleted;
  final int currentOrientationView;
  const CustomCardUser(
      {super.key,
      required this.users,
      required this.onTap,
      required this.currentOrientationView,
      required this.isSeleted});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: isSeleted ? 2.5 : 0.5,
            color: isSeleted ? kBlueGreyColor : kBlackColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: currentOrientationView == 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: users.avatar,
                        width: 80,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.person,
                          size: 50.0,
                        ),
                      ),
                    ),
                    boxWidth(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${users.firstName} ${users.lastName}",
                          style: blackTextStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        boxheight(10),
                        Text(
                          users.email,
                          style: blackTextStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: users.avatar,
                        width: 80,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.person,
                          size: 50.0,
                        ),
                      ),
                    ),
                    boxWidth(10),
                    Text(
                      "${users.firstName} ${users.lastName}",
                      style: blackTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    boxheight(10),
                    Text(
                      users.email,
                      style: blackTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
