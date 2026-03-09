#!/bin/bash
# Export a DrawIO diagram to PNG, SVG, or PDF
# Usage: ./export_diagram.sh <input.drawio> <output.png|svg|pdf> [zoom] [page-index]

set -e

if [ $# -lt 2 ]; then
    echo "Usage: $0 <input.drawio> <output.png|svg|pdf> [zoom] [page-index]"
    echo ""
    echo "Examples:"
    echo "  $0 diagram.drawio output.png"
    echo "  $0 diagram.drawio output.svg"
    echo "  $0 diagram.drawio output.png 2      # 200% zoom"
    echo "  $0 diagram.drawio output.png 1 0    # 100% zoom, first page only"
    exit 1
fi

INPUT="$1"
OUTPUT="$2"
ZOOM="${3:-1}"
PAGE_INDEX="${4:-}"

# Check if input file exists
if [ ! -f "$INPUT" ]; then
    echo "Error: Input file '$INPUT' not found"
    exit 1
fi

# Build drawio command
CMD="drawio -x \"$INPUT\" -o \"$OUTPUT\" --zoom $ZOOM"

# Add page index if specified
if [ -n "$PAGE_INDEX" ]; then
    CMD="$CMD --page-index $PAGE_INDEX"
fi

echo "Exporting: $INPUT -> $OUTPUT"
echo "Command: $CMD"

eval $CMD

echo "Done! Output: $OUTPUT"
