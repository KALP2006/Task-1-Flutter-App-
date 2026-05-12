class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final int reviews;
  final String description;
  final String emoji;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.emoji,
  });
}

const List<Product> sampleProducts = [
  Product(
    id: 1,
    name: 'Wireless Noise-Cancelling Headphones',
    category: 'Electronics',
    price: 2499.00,
    rating: 4.7,
    reviews: 1240,
    description: 'Premium over-ear headphones with active noise cancellation, '
        '30-hour battery life, and crystal-clear audio. Perfect for commuters '
        'and audiophiles who demand the best sound quality.',
    emoji: '🎧',
  ),
  Product(
    id: 2,
    name: 'Mechanical Keyboard',
    category: 'Electronics',
    price: 1899.00,
    rating: 4.5,
    reviews: 876,
    description: 'Compact TKL mechanical keyboard with tactile brown switches, '
        'per-key RGB backlighting, and a durable aluminum frame. '
        'A must-have for programmers and gamers alike.',
    emoji: '⌨️',
  ),
  Product(
    id: 3,
    name: 'Ergonomic Office Chair',
    category: 'Furniture',
    price: 12999.00,
    rating: 4.8,
    reviews: 543,
    description: 'Fully adjustable ergonomic chair with lumbar support, '
        'breathable mesh back, and 4D armrests. Designed for long work '
        'sessions to keep your posture in check and comfort at its peak.',
    emoji: '🪑',
  ),
  Product(
    id: 4,
    name: 'Stainless Steel Water Bottle',
    category: 'Lifestyle',
    price: 599.00,
    rating: 4.6,
    reviews: 3200,
    description:
        'Double-walled vacuum-insulated bottle that keeps drinks cold for '
        '24 hours and hot for 12. BPA-free, leak-proof lid, and built '
        'to last a lifetime.',
    emoji: '🧴',
  ),
  Product(
    id: 5,
    name: 'Running Shoes',
    category: 'Fitness',
    price: 3299.00,
    rating: 4.4,
    reviews: 2100,
    description: 'Lightweight running shoes with responsive foam cushioning, '
        'a breathable knit upper, and a durable rubber outsole. '
        'Engineered for both road runs and light trail adventures.',
    emoji: '👟',
  ),
  Product(
    id: 6,
    name: 'Portable Bluetooth Speaker',
    category: 'Electronics',
    price: 1199.00,
    rating: 4.3,
    reviews: 980,
    description: 'Compact 360° speaker with rich bass, IPX7 waterproofing, '
        'and up to 20 hours of playtime. Take the party anywhere — '
        'beach, camping, or backyard BBQ.',
    emoji: '🔊',
  ),
  Product(
    id: 7,
    name: 'Ceramic Coffee Mug Set',
    category: 'Kitchen',
    price: 449.00,
    rating: 4.9,
    reviews: 670,
    description: 'Set of 4 handcrafted ceramic mugs in earthy tones. '
        'Microwave and dishwasher safe, each with a satisfying 350ml capacity. '
        'A lovely gift or a daily ritual upgrade.',
    emoji: '☕',
  ),
];
