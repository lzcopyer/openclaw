#!/bin/bash
# Batch export all DrawIO diagrams in a directory
# Usage: ./batch_export.sh <input-dir> <output-dir> <format>

set -e

if [ $# -lt 3 ]; then
    echo "Usage: $0 <input-dir> <output-dir> <format>"
    echo ""
    echo "Arguments:"
    echo "  input-dir   - Directory containing .drawio files"
    echo "  output-dir  - Directory for exported files"
    echo "  format      - Output format: png, svg, or pdf"
    echo ""
    echo "Example:"
    echo "  $0 ./diagrams ./exports png"
    exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="$2"
FORMAT="$3"
ZOOM="${4:-1}"

# Validate format
case "$FORMAT" in
    png|svg|pdf)
        ;;
    *)
        echo "Error: Format must be 'png', 'svg', or 'pdf'"
        exit 1
        ;;
esac

# Check input directory
if [ ! -d "$INPUT_DIR" ]; then
    echo "Error: Input directory '$INPUT_DIR' not found"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Count files
COUNT=0
FAILED=0

echo "Batch exporting .drawio files from $INPUT_DIR to $OUTPUT_DIR (format: $FORMAT)"
echo "-------------------------------------------------------------------"

for file in "$INPUT_DIR"/*.drawio; do
    if [ -f "$file" ]; then
        COUNT=$((COUNT + 1))
        basename=$(basename "$file" .drawio)
        output="$OUTPUT_DIR/${basename}.${FORMAT}"
        
        echo "[$COUNT] Exporting: $basename"
        
        if drawio -x "$file" -o "$output" --zoom "$ZOOM" 2>/dev/null; then
            echo "      ✓ Success: $output"
        else
            echo "      ✗ Failed: $file"
            FAILED=$((FAILED + 1))
        fi
    fi
done

echo "-------------------------------------------------------------------"
echo "Complete! Exported $COUNT files ($FAILED failures)"

if [ $COUNT -eq 0 ]; then
    echo "No .drawio files found in $INPUT_DIR"
fi
