import './laptop.dart';

class MockData {
  static final List<Laptop> laptops = [
    Laptop(
      id: '1',
      name: 'Zenith Blade X1',
      description: 'Ultra-slim gaming powerhouse with RGB keyboard.',
      price: 2499.99,
      cpu: 'Intel i9-14900HK',
      ram: '32GB DDR5',
      storage: '2TB NVMe SSD',
      imageUrl: 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=500&auto=format&fit=crop&q=60',
    ),
    Laptop(
      id: '2',
      name: 'Nebula Pro 16',
      description: 'Professional creative workstation with 4K OLED.',
      price: 3299.00,
      cpu: 'M3 Max',
      ram: '64GB Unified',
      storage: '1TB SSD',
      imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca4?w=500&auto=format&fit=crop&q=60',
    ),
    Laptop(
      id: '3',
      name: 'Velocity Air',
      description: 'Lightweight daily driver for students and pros.',
      price: 1199.50,
      cpu: 'Ryzen 7 7840U',
      ram: '16GB LPDDR5',
      storage: '512GB SSD',
      imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=500&auto=format&fit=crop&q=60',
    ),
    Laptop(
      id: '4',
      name: 'Titan Titan',
      description: 'Desktop replacement with mechanical keys.',
      price: 4500.00,
      cpu: 'Intel i9-13980HX',
      ram: '128GB DDR5',
      storage: '8TB RAID 0',
      imageUrl: 'https://images.unsplash.com/photo-1593640408182-31c70c8268f5?w=500&auto=format&fit=crop&q=60',
    ),
    Laptop(
      id: '5',
      name: 'Stealth 14',
      description: 'Compact productivity machine.',
      price: 1599.00,
      cpu: 'Intel Core Ultra 7',
      ram: '32GB DDR5',
      storage: '1TB SSD',
      imageUrl: 'https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=500&auto=format&fit=crop&q=60',
    ),
  ];
}
