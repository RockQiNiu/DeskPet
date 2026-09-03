"""Create transparent PLACEHOLDER_ONLY PNG sequences for the 2D pipeline."""
from __future__ import annotations

import json
import struct
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ASSET_ROOT = ROOT / "assets" / "pets" / "mage2d"

def chunk(kind: bytes, data: bytes) -> bytes:
    return struct.pack(">I", len(data)) + kind + data + struct.pack(">I", zlib.crc32(kind + data) & 0xffffffff)

def placeholder_png(width: int = 512, height: int = 512) -> bytes:
    # Fully transparent canvas with a small semi-transparent magenta diamond:
    # visibly a placeholder, never usable as final character art.
    rows = []
    for y in range(height):
        row = bytearray([0])
        for x in range(width):
            distance = abs(x - width // 2) + abs(y - height // 2)
            if distance < 58:
                row.extend((255, 0, 255, 180))
            else:
                row.extend((0, 0, 0, 0))
        rows.append(bytes(row))
    raw = b"".join(rows)
    return b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", width, height, 8, 6, 0, 0, 0)) + chunk(b"IDAT", zlib.compress(raw, 9)) + chunk(b"IEND", b"")

def main() -> None:
    metadata = json.loads((ASSET_ROOT / "metadata" / "animations.json").read_text(encoding="utf-8"))
    data = placeholder_png()
    for name, spec in metadata["animations"].items():
        directory = ASSET_ROOT / name
        directory.mkdir(parents=True, exist_ok=True)
        for index in range(1, spec["frames"] + 1):
            (directory / f"{name}_{index:04d}.png").write_bytes(data)
    for name in ("source", "previews"):
        (ASSET_ROOT / name).mkdir(parents=True, exist_ok=True)
    print("Created PLACEHOLDER_ONLY mage2d frame sequences.")

if __name__ == "__main__":
    main()
