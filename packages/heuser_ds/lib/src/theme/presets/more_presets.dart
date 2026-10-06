import 'dart:ui' show Color;

import 'package:heuser_ds/src/theme/presets/h_preset.dart';
import 'package:heuser_ds/src/theme/presets/heuser_classic.dart';

/// Navy-first preset: the brand navy carries the UI, apricot stays the accent.
/// Its dark scheme is the "true" version; light is a muted navy on cool grey.
final HPreset kNavyNight = HPreset(
  id: 'navy_night',
  label: 'Navy Night',
  description: 'Deep navy with periwinkle highlights; best in dark mode.',
  light: kHeuserClassicLight.copyWith(
    brand: const Color(0xFF00172E),
    brandSoft: const Color(0xFFDCDDE8),
    brandStrong: const Color(0xFF000F1D),
    surface: const Color(0xFFF5F5F7),
    surfaceAlt: const Color(0xFFECEDF2),
    heroGradientStart: const Color(0xFFDCDDE8),
    heroGradientEnd: const Color(0xFFFFEBD8),
    navIndicator: const Color(0xFF00172E),
    focusRing: const Color(0xFF9FB3D9),
  ),
  dark: kHeuserClassicDark.copyWith(
    brand: const Color(0xFF9FB3D9),
    onBrand: const Color(0xFF000F1D),
    brandSoft: const Color(0xFF223246),
    brandStrong: const Color(0xFFDCDDE8),
    heroGradientStart: const Color(0xFF0B1A2B),
    heroGradientEnd: const Color(0xFF2A3A50),
    navIndicator: const Color(0xFF9FB3D9),
    focusRing: const Color(0xFF9FB3D9),
  ),
);

/// Warm preset built on the apricot accent.
final HPreset kApricotDawn = HPreset(
  id: 'apricot_dawn',
  label: 'Apricot Dawn',
  description: 'Warm apricot and clay on cream surfaces.',
  light: kHeuserClassicLight.copyWith(
    brand: const Color(0xFFA8541A),
    brandSoft: const Color(0xFFFFEBD8),
    brandStrong: const Color(0xFF6A3610),
    accent: const Color(0xFF881A21),
    accentSoft: const Color(0xFFF8D4D7),
    surface: const Color(0xFFFFFBF7),
    surfaceAlt: const Color(0xFFFBF3EA),
    divider: const Color(0xFFF2E8DC),
    outlineSoft: const Color(0xFFEBDCCB),
    heroGradientStart: const Color(0xFFFFEBD8),
    heroGradientEnd: const Color(0xFFFBF3EA),
    navIndicator: const Color(0xFFA8541A),
    focusRing: const Color(0xFFFFBC7D),
  ),
  dark: kHeuserClassicDark.copyWith(
    brand: const Color(0xFFFFBC7D),
    onBrand: const Color(0xFF4A2A10),
    brandSoft: const Color(0xFF5A3A20),
    brandStrong: const Color(0xFFFFE3C8),
    accent: const Color(0xFFF6AEB3),
    onAccent: const Color(0xFF5A0E14),
    accentSoft: const Color(0xFF4A1418),
    surface: const Color(0xFF1A1410),
    surfaceAlt: const Color(0xFF241C16),
    surfaceRaised: const Color(0xFF30261E),
    outline: const Color(0xFF55463A),
    outlineSoft: const Color(0xFF3E3129),
    divider: const Color(0xFF302620),
    heroGradientStart: const Color(0xFF30261E),
    heroGradientEnd: const Color(0xFF5A3A20),
    shimmerBase: const Color(0xFF30261E),
    shimmerHighlight: const Color(0xFF3E3129),
    navIndicator: const Color(0xFFFFBC7D),
    focusRing: const Color(0xFFC2661F),
  ),
);

/// Calm green preset for a quieter, academic feel.
final HPreset kMintCalm = HPreset(
  id: 'mint_calm',
  label: 'Mint Calm',
  description: 'Soft greens and sage on cool white.',
  light: kHeuserClassicLight.copyWith(
    brand: const Color(0xFF2E7D5B),
    brandSoft: const Color(0xFFD7F0E4),
    brandStrong: const Color(0xFF174633),
    accent: const Color(0xFF2A5C9A),
    accentSoft: const Color(0xFFDCE8F7),
    surface: const Color(0xFFF7FBF9),
    surfaceAlt: const Color(0xFFEDF5F1),
    divider: const Color(0xFFE2ECE7),
    outlineSoft: const Color(0xFFD0DED7),
    heroGradientStart: const Color(0xFFD7F0E4),
    heroGradientEnd: const Color(0xFFDCE8F7),
    navIndicator: const Color(0xFF2E7D5B),
    focusRing: const Color(0xFF8FD6B4),
  ),
  dark: kHeuserClassicDark.copyWith(
    brand: const Color(0xFF8FD6B4),
    onBrand: const Color(0xFF0F2E21),
    brandSoft: const Color(0xFF1F4D3A),
    brandStrong: const Color(0xFFC9EEDC),
    accent: const Color(0xFF9EC2F0),
    onAccent: const Color(0xFF0C2240),
    accentSoft: const Color(0xFF1E3A5F),
    surface: const Color(0xFF0B1A14),
    surfaceAlt: const Color(0xFF12241C),
    surfaceRaised: const Color(0xFF1B3128),
    outline: const Color(0xFF34504A),
    outlineSoft: const Color(0xFF243B33),
    divider: const Color(0xFF1C2F28),
    heroGradientStart: const Color(0xFF1B3128),
    heroGradientEnd: const Color(0xFF1E3A5F),
    shimmerBase: const Color(0xFF1B3128),
    shimmerHighlight: const Color(0xFF243B33),
    navIndicator: const Color(0xFF8FD6B4),
    focusRing: const Color(0xFF2E7D5B),
  ),
);
