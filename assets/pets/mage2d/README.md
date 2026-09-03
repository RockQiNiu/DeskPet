# Mage2D sprite assets

The formal animation set is: `idle`, `walk`, `run`, `jump`, `sit`, `wave`, `sleep`, `celebrate`, `dead`, `angry`, and `happy`.

Each sequence contains RGBA PNG frames named `<animation>_0001.png`, `<animation>_0002.png`, etc. Every frame uses a 512x512 canvas and a bottom-centre foot anchor (`[0.5, 1.0]`). The runtime mirrors right-facing motion in QML for left movement; no duplicate left-facing PNG set is required.
