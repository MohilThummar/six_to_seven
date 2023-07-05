import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String? title;
  final String? time;
  final String? description;
  final String? count;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const ToDoTile({
    Key? key,
    this.title,
    this.time,
    this.description,
    this.count,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            color: Colors.grey.shade400,
            child: Text(
              count ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title ?? "",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 14,
                    width: 1.5,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Text(
                    time ?? "",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                description ?? "",
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onDelete,
            splashRadius: 10,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: onEdit,
            splashRadius: 10,
            icon: const Icon(
              Icons.edit,
              color: Colors.green,
              size: 20,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
