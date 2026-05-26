import 'package:flutter/material.dart';

Widget _buildDrawer() {
    final items = [
      {'icon': '✉️',  'label': 'Mensagens',     'badge': '3'},
      {'icon': '💎',  'label': 'Meus Cristais',  'badge': _formatNumber(crystals)},
      {'icon': '📦',  'label': 'Baús da Semana', 'badge': null},
      {'icon': '🏆',  'label': 'Conquistas',     'badge': null},
      {'icon': '⚙️', 'label': 'Configurações',  'badge': null},
    ];
    return Drawer(
      backgroundColor: surfaceColor,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 52, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1976D2), Color(0xFF1565C0)],
              ),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                    border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
                  ),
                  child: const Center(child: Text('👤', style: TextStyle(fontSize: 26))),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Gustavo Dias',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'gustavo@email.com',
                  style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.7)),
                ),
              ],
            ),
          ),
          ...items.map((item) => GestureDetector(
            onTap: () {
              Navigator.pop(context);
              _showToast('Abrindo ${item['label']}…');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: borderColor)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: blueColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(item['icon'] as String, style: const TextStyle(fontSize: 17)),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    item['label'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (item['badge'] != null) ...[
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: accColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        item['badge'] as String,
                        style: const TextStyle(
                          color: bgColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }