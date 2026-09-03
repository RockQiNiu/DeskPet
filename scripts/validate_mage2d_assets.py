"""Validate Mage2D PNG sequence assets and write a Markdown report."""
from __future__ import annotations

import json
import re
import struct
import sys
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ASSET_ROOT = ROOT / "assets" / "pets" / "mage2d"
REPORT = ROOT / "output" / "reports" / "mage2d_assets_validation.md"

def png_info(path: Path) -> tuple[int, int, int, bool]:
    data = path.read_bytes()
    if not data.startswith(b"\x89PNG\r\n\x1a\n"):
        raise ValueError("not a PNG")
    width, height, depth, color_type, _, _, _ = struct.unpack(">IIBBBBB", data[16:29])
    if depth != 8 or color_type != 6:
        raise ValueError(f"expected RGBA/8 PNG, got color_type={color_type}, depth={depth}")
    offset, compressed = 8, bytearray()
    while offset < len(data):
        length = struct.unpack(">I", data[offset:offset + 4])[0]
        kind = data[offset + 4:offset + 8]
        payload = data[offset + 8:offset + 8 + length]
        offset += 12 + length
        if kind == b"IDAT": compressed.extend(payload)
        if kind == b"IEND": break
    pixels = zlib.decompress(compressed)
    stride = width * 4 + 1
    has_alpha = any(pixels[row * stride + 1 + x * 4 + 3] < 255 for row in range(height) for x in range(width))
    return width, height, color_type, has_alpha

def main() -> int:
    errors, notes = [], []
    metadata_path = ASSET_ROOT / "metadata" / "animations.json"
    try:
        metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
    except Exception as error:
        print(f"Invalid metadata: {error}", file=sys.stderr); return 2
    if metadata.get("version") != 1 or not isinstance(metadata.get("animations"), dict):
        errors.append("metadata must contain version=1 and an animations object")
    for name, spec in metadata.get("animations", {}).items():
        directory = ASSET_ROOT / name
        expected = [directory / f"{name}_{index:04d}.png" for index in range(1, spec.get("frames", 0) + 1)]
        actual = sorted(directory.glob("*.png")) if directory.exists() else []
        if actual != expected:
            errors.append(f"{name}: expected contiguous 4-digit frame sequence ({len(expected)} files), found {len(actual)}")
            continue
        sizes = set()
        for frame in actual:
            try:
                width, height, _, has_alpha = png_info(frame)
                sizes.add((width, height))
                if not has_alpha: errors.append(f"{frame.relative_to(ROOT)}: no alpha channel pixels")
            except Exception as error:
                errors.append(f"{frame.relative_to(ROOT)}: {error}")
        if len(sizes) != 1: errors.append(f"{name}: inconsistent frame dimensions: {sorted(sizes)}")
        if spec.get("anchor") != [0.5, 1.0]: errors.append(f"{name}: anchor must be [0.5, 1.0]")
    if metadata.get("placeholder_only"):
        notes.append("PLACEHOLDER_ONLY assets detected: visual identity/bounding-box checks are deferred until a reference image is supplied.")
    REPORT.parent.mkdir(parents=True, exist_ok=True)
    lines = ["# Mage2D asset validation", "", "## Result", "", "PASS" if not errors else "FAIL", "", "## Notes", ""]
    lines += [f"- {note}" for note in notes] or ["- None"]
    lines += ["", "## Errors", ""] + ([f"- {error}" for error in errors] or ["- None"])
    REPORT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{REPORT.relative_to(ROOT)}: {'PASS' if not errors else 'FAIL'}")
    return 0 if not errors else 1

if __name__ == "__main__":
    raise SystemExit(main())
