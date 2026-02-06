#!/bin/bash
# Based05 workspace setup - run once on first boot

echo "🚀 Setting up Based05 isolated workspaces..."

# NSFW/Experimental (Arch - bleeding edge, GPU access)
distrobox create --nvidia \
  --name nsfw-zone \
  --image archlinux:latest \
  --home ~/Documents/NSFW \
  --yes 2>/dev/null || echo "nsfw-zone already exists"

# Professional (Ubuntu LTS - stable, client-safe)
distrobox create \
  --name professional \
  --image ubuntu:22.04 \
  --home ~/Documents/Professional \
  --yes 2>/dev/null || echo "professional already exists"

# AI/ML workspace (Python 3.11, GPU access, isolated deps)
distrobox create --nvidia \
  --name ai-lab \
  --image python:3.11-slim \
  --home ~/Documents/AI \
  --volume ~/Models:/models:ro \
  --yes 2>/dev/null || echo "ai-lab already exists"

# Music production (Fedora, audio device access)
distrobox create \
  --name music-studio \
  --image fedora:latest \
  --home ~/Documents/Music \
  --additional-flags "--device /dev/snd" \
  --yes 2>/dev/null || echo "music-studio already exists"

echo ""
echo "✅ Based05 workspaces configured!"
echo ""
echo "Access your isolated spaces:"
echo "  🔞 distrobox enter nsfw-zone        (Arch, GPU, experiments)"
echo "  💼 distrobox enter professional     (Ubuntu, stable, client-safe)"
echo "  🤖 distrobox enter ai-lab           (Python 3.11, GPU, AI/ML)"
echo "  🎵 distrobox enter music-studio     (Fedora, audio production)"
echo ""
echo "Each workspace has its own home directory - completely isolated"
echo "GPU available in: nsfw-zone, ai-lab"
