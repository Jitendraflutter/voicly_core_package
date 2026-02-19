import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cats = [
      {"name": "Astrology", "count": 45, "icon": Icons.star},
      {"name": "Relationship", "count": 120, "icon": Icons.favorite},
      {"name": "Fitness", "count": 32, "icon": Icons.fitness_center},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Service Categories", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text("Add New")),
          ],
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2,
          ),
          itemCount: cats.length,
          itemBuilder: (context, index) => Card(
            child: Center(
              child: ListTile(
                leading: CircleAvatar(child: Icon(cats[index]['icon'])),
                title: Text(cats[index]['name']),
                subtitle: Text("${cats[index]['count']} Callers"),
                trailing: const Icon(Icons.edit, size: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}