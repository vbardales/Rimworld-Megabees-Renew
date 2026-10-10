# Preview generation

The text-free illustration is preserved as `Preview-source.png`. The bespoke megabee
line-art is committed at its final render size in `echo.png`, and the clean transparent
badge artwork is `ModIcon-source.png`.

All copy, palette and placement settings live in `Preview.config.json`. Render from the
mod root with the shared renderer:

```powershell
node ../scripts/Render-Preview.cjs
```

It writes `Mod/About/Preview.png`, `Art/Gallery/0-preview.png`, `Art/Preview.ico` and
`Art/ModIcon.ico`; reproducible layout checks are generated under `Art/.render/`.

`Megabees` uses the RimWorld title font. `Renew` and the description use
Segoe UI; `Renew` stays on one line at one size. The line-art is flipped
horizontally and the ModIcon sits bottom-left at 15 degrees.

## Original background prompt

Prompt used:

> Create a new landscape 16:9 RimWorld mod Workshop illustration, without text. The reference is ONLY the animal design: huge flightless ground bee with dark head, rounded elongated abdomen with olive yellow and nearly black stripes, no wings, no stinger. Scene: a small timber fenced colony animal yard with two elephant-sized docile megabees, one adult and a smaller young bee, on the RIGHT HALF, beside a small pile of wool, cream eggs and a bowl of tallow. Reserve left half as calm simple ground for later title overlay. High oblique overhead camera 60-70 degrees above horizon, near orthographic, no vanishing point, floor fills frame with packed-earth square tile rhythm, low fence. Matte hand-painted game illustration, soft edges, simple shapes, no visible brush texture, no thick outlines, no photorealism, no 3D render. Dominant cool desaturated olive earth palette, warm gold light pool from one modest standing colony lamp near animals, small muted teal container accent. Soft contact shadows. No people, no faces with expressive human features. No text, numbers, UI, border, logo, watermark, magic particles, lens effects, floating diorama or sky. Make the actual bee silhouettes clear at thumbnail size.
