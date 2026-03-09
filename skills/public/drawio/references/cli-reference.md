# DrawIO CLI Reference

## Command Syntax

```bash
drawio <command> [options]
```

## Commands

### Export (x)

Export a diagram to an image or PDF.

```bash
drawio -x <input> -o <output> [options]
```

**Options:**

| Option           | Description                | Default |
| ---------------- | -------------------------- | ------- |
| `-x`, `--export` | Export mode                | -       |
| `-o`, `--output` | Output file path           | -       |
| `--zoom`         | Zoom level (0.1-10)        | 1       |
| `--page-index`   | Page to export (0-based)   | all     |
| `--all-pages`    | Export all pages           | false   |
| `--width`        | Output width in pixels     | auto    |
| `--height`       | Output height in pixels    | auto    |
| `--border`       | Border around diagram      | 0       |
| `--transparent`  | Transparent background     | false   |
| `--embed-svg`    | Embed raster images in SVG | false   |

## Output Formats

The output format is determined by the file extension:

- `.png` - PNG image (raster)
- `.svg` - SVG image (vector)
- `.pdf` - PDF document (vector)
- `.jpg` / `.jpeg` - JPEG image (raster)

## Examples

### Basic Export

```bash
# Export to PNG
drawio -x diagram.drawio -o diagram.png

# Export to SVG
drawio -x diagram.drawio -o diagram.svg

# Export to PDF
drawio -x diagram.drawio -o diagram.pdf
```

### High Resolution Export

```bash
# 200% zoom
drawio -x diagram.drawio -o diagram.png --zoom 2

# 300% zoom for print quality
drawio -x diagram.drawio -o diagram.png --zoom 3
```

### Export Specific Pages

```bash
# Export first page only
drawio -x diagram.drawio -o diagram.png --page-index 0

# Export all pages as separate files
drawio -x diagram.drawio -o diagram.png --all-pages

# Export pages 0-2
drawio -x diagram.drawio -o diagram.png --page-index 0,1,2
```

### Custom Dimensions

```bash
# Fixed width (height auto)
drawio -x diagram.drawio -o diagram.png --width 1920

# Fixed height (width auto)
drawio -x diagram.drawio -o diagram.png --height 1080

# Fixed dimensions
drawio -x diagram.drawio -o diagram.png --width 1920 --height 1080
```

### Transparent Background

```bash
# PNG with transparency
drawio -x diagram.drawio -o diagram.png --transparent
```

### Add Border

```bash
# Add 20px border
drawio -x diagram.drawio -o diagram.png --border 20
```

## Batch Processing

### Export All Files in Directory

```bash
# Bash loop
for f in *.drawio; do
    drawio -x "$f" -o "${f%.drawio}.png"
done
```

### Export with Custom Zoom

```bash
for f in *.drawio; do
    drawio -x "$f" -o "${f%.drawio}@2x.png" --zoom 2
done
```

## Tips

1. **For presentations:** Use `--zoom 2` for retina displays
2. **For documentation:** SVG format scales best
3. **For printing:** PDF format or PNG with `--zoom 3`
4. **For web:** PNG with `--zoom 1` or `--zoom 2`

## Common Issues

### Blank Output

- Ensure diagram has content on the exported page
- Try specifying `--page-index 0` explicitly

### Low Quality

- Increase `--zoom` value
- Use SVG format for vector quality

### Memory Issues with Large Diagrams

- Export pages individually
- Reduce zoom level
- Close other applications
