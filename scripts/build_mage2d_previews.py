"""Create developer-only GIF previews from Mage2D PNG sequences (requires Pillow)."""
from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ASSET_ROOT = ROOT / "assets" / "pets" / "mage2d"

def main() -> int:
    try:
        from PIL import Image
    except ImportError:
        print("Pillow is required: py -m pip install Pillow", file=sys.stderr)
        return 2
    metadata = json.loads((ASSET_ROOT / "metadata" / "animations.json").read_text(encoding="utf-8"))
    output = ASSET_ROOT / "previews"; output.mkdir(parents=True, exist_ok=True)
    for name, spec in metadata["animations"].items():
        frames = [Image.open(ASSET_ROOT / name / f"{name}_{index:04d}.png").convert("RGBA") for index in range(1, spec["frames"] + 1)]
        frames[0].save(output / f"{name}.gif", save_all=True, append_images=frames[1:], duration=round(1000 / spec["fps"]), loop=0 if spec["loop"] else 1, disposal=2, transparency=0)
    print(f"Wrote previews to {output.relative_to(ROOT)}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
