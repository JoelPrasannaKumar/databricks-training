# Phase 4: Mini Project - Business Pipeline & Analytics

## Objective
Build the first end-to-end data pipeline moving from isolated queries to a structured workflow that generates actionable business insights and segmentation models.

## Contents
- **`samples/`**: Sample datasets engineered to require deduplication, invalid value filtering, and type checking.
- **`pipeline.sql`**: SQL logic using Common Table Expressions (CTEs) to pre-clean data and generate analytical tables.
- **`pipeline.py`**: A fully functional PySpark pipeline that runs the 6 analytical tasks, creates a Gold/Silver/Bronze customer segmentation, and saves the final output report.
- **`outputs/`**: Text-based output logs and the final `/report` CSV file as requested by the instructions.

## Key Concepts Practiced
* Advanced data cleaning (duplicate removal, invalid value handling, null key dropping).
* Conditional business logic (`when`, `otherwise`) for segmentation.
* Complex grouped aggregations to generate metrics like top spenders and repeat customer counts.
* Overwriting output files in CSV formats.
