
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: DropdownButton<String>(
          value: 'Jakarta',
          icon: const Icon(Icons.keyboard_arrow_down),
          items: <String>['Jakarta', 'Ho Chi Minh', 'Ha Noi'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (String? newValue) {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              const SizedBox(height: 16),
              PropertyTypeSelector(),
              const SizedBox(height: 16),
              const SectionHeader(title: 'Near from you'),
              const SizedBox(height: 16),
              NearFromYouList(),
              const SizedBox(height: 16),
              const  SectionHeader(title: 'Best for you'),
              const SizedBox(height: 16),
              BestForYouList(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search address, or near you',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class PropertyTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PropertyTypeButton(label: 'House', selected: true),
        PropertyTypeButton(label: 'Apartment'),
        PropertyTypeButton(label: 'Hotel'),
        PropertyTypeButton(label: 'Villa'),
        PropertyTypeButton(label: 'Condo'),
      ],
    );
  }
}

class PropertyTypeButton extends StatelessWidget {
  final String label;
  final bool selected;

  const PropertyTypeButton({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('See more'),
        ),
      ],
    );
  }
}

class NearFromYouList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          NearFromYouCard(
            imageUrl: 'https://i.pinimg.com/enabled_lo/236x/f9/15/03/f9150342bf05cd3ace0a25adc00c6f2c.jpg',
            title: 'Dreamsville House',
            address: 'Jl Sultan Iskandar Muda',
            distance: '1.8 km',
          ),
          NearFromYouCard(
            imageUrl: 'https://i.pinimg.com/enabled_lo/236x/be/07/fc/be07fcbcd542ee133cc8c27f10fac641.jpg',
            title: 'Ascot House',
            address: 'Jl Cilandak Tengah',
            distance: '2.0 km',
          ),
        ],
      ),
    );
  }
}

class NearFromYouCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final String distance;

  const NearFromYouCard({
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl, fit: BoxFit.cover, height: 120),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(distance),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(address),
        ],
      ),
    );
  }
}

class BestForYouList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children:  [
        BestForYouCard(
          imageUrl: 'https://i.pinimg.com/enabled_lo/236x/7a/94/64/7a9464be91b945909e957c98cbef6eff.jpg',
          title: 'Orchad House',
          price: 'Rp. 2.500.000.000 / Year',
          bedrooms: '6 Bedroom',
          bathrooms: '4 Bathroom',
        ),
        BestForYouCard(
          imageUrl: 'https://i.pinimg.com/enabled_lo/236x/1f/24/dd/1f24dd6c8c628b5318f282f3c034ef28.jpg',
          title: 'The Hollies House',
          price: 'Rp. 2.000.000.000 / Year',
          bedrooms: '5 Bedroom',
          bathrooms: '2 Bathroom',
        ),
      ],
    );
  }
}

class BestForYouCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String bedrooms;
  final String bathrooms;

  const BestForYouCard({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(price),
                Row(
                  children:  [
                    const Icon(Icons.king_bed, size: 16),
                    const SizedBox(width: 4),
                    Text(bedrooms),
                    const SizedBox(width: 16),
                    const Icon(Icons.bathtub, size: 16),
                    const SizedBox(width: 4),
                    Text(bathrooms),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}