---
name: drawio
description: Create, edit, and export DrawIO diagrams (system architecture diagrams, flowcharts, UML). Use when working with .drawio or .xml diagram files for: (1) Creating new architecture/flowchart diagrams, (2) Exporting to PNG/SVG/PDF, (3) Batch processing diagrams, (4) Working with drawio-cli command line tool.
---

# DrawIO Diagram Skill

## Overview

This skill enables working with DrawIO (.drawio) files for creating and exporting system architecture diagrams and flowcharts using the `drawio-cli` command line tool.

## Installation

Before using this skill, install drawio-cli:

```bash
npm install -g drawio-cli
```

Verify installation:

```bash
drawio --version
```

See [references/installation.md](references/installation.md) for detailed setup instructions.

## Quick Start

### Export a diagram to PNG

```bash
drawio -x input.drawio -o output.png
```

### Export all drawio files in a folder

```bash
for f in *.drawio; do drawio -x "$f" -o "${f%.drawio}.png"; done
```

See [scripts/export_diagram.sh](scripts/export_diagram.sh) for a reusable script.

## Common Tasks

### Create New Diagram

Use the templates in [assets/templates/](assets/templates/) as starting points:

- `system-architecture.drawio` - Base template for system architecture diagrams
- `flowchart.drawio` - Base template for flowcharts

### Export Diagrams

**Export to PNG (default, 100% zoom):**

```bash
drawio -x input.drawio -o output.png
```

**Export to SVG:**

```bash
drawio -x input.drawio -o output.svg
```

**Export to PDF:**

```bash
drawio -x input.drawio -o output.pdf
```

**Export with custom zoom:**

```bash
drawio -x input.drawio -o output.png --zoom 2
```

**Export specific pages:**

```bash
drawio -x input.drawio -o output.png --page-index 0
```

### Batch Export

Export all diagrams in a directory:

```bash
./scripts/batch_export.sh ./diagrams/ ./output/ png
```

See [scripts/batch_export.sh](scripts/batch_export.sh) for the full script.

## Architecture Diagram Best Practices

When creating system architecture diagrams:

1. **Use consistent shapes:**
   - Cylinders for databases
   - Rectangles for services/applications
   - Clouds for external services
   - Arrows for data flow direction

2. **Label clearly:**
   - Service names
   - Protocols (HTTP, gRPC, etc.)
   - Data stores

3. **Group related components:**
   - Use containers/boundaries for microservices
   - Separate by environment (prod, staging)
   - Network boundaries (VPC, subnet)

See [references/architecture-patterns.md](references/architecture-patterns.md) for common architecture diagram patterns and examples.

## Flowchart Best Practices

When creating flowcharts:

1. **Standard symbols:**
   - Oval: Start/End
   - Rectangle: Process/Action
   - Diamond: Decision
   - Parallelogram: Input/Output

2. **Flow direction:**
   - Top to bottom or left to right
   - Consistent throughout the diagram

3. **Decision labels:**
   - Label all branches (Yes/No, True/False)

See [references/flowchart-patterns.md](references/flowchart-patterns.md) for flowchart templates and examples.

## Resources

### scripts/

- `export_diagram.sh` - Export a single diagram with options
- `batch_export.sh` - Batch export all diagrams in a directory
- `create_template.py` - Generate new diagram templates programmatically

### references/

- `installation.md` - Installation and setup guide
- `cli-reference.md` - Complete drawio-cli command reference
- `architecture-patterns.md` - System architecture diagram patterns
- `flowchart-patterns.md` - Flowchart patterns and examples
- `ai-prompt.md` - **AI Assistant Prompt** - Comprehensive guide for AI to create professional diagrams

### assets/

- `templates/` - Ready-to-use diagram templates
  - `system-architecture.drawio`
  - `flowchart.drawio`
  - `network-topology.drawio`

---

## Troubleshooting

**"drawio: command not found"**

- Install with `npm install -g drawio-cli`
- Ensure npm global bin is in PATH

**Export produces blank image**

- Check that the diagram has content on the page being exported
- Try `--page-index 0` to specify first page explicitly

**Low quality export**

- Use `--zoom 2` or higher for better resolution
- Export to SVG for vector quality
