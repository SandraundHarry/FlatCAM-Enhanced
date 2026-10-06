# FlatCAM 8.994 Enhanced

**FlatCAM 8.994 Enhanced** is a community-maintained fork of FlatCAM Beta 8.994 focused on improving stability, usability, and practical CNC PCB manufacturing workflows.

FlatCAM is a 2D computer-aided manufacturing application for preparing CNC jobs from PCB manufacturing data such as Gerber and Excellon files. This fork began as an effort to make the existing 8.994 codebase reliable for our own PCB milling workflow. During real-world use we fixed crashes and broken code paths and added workflow improvements where the original behavior was impractical or ambiguous.

> This is an independent community fork. It is not an official continuation or release of the original FlatCAM project.

## What has been improved

### Stability and compatibility

A number of failures in the original 8.994 codebase have been investigated and corrected, including GUI/thread interaction issues, outdated function calls, tool handling problems, and several error paths discovered during real PCB production tests.

### Tool Database

Tool Database handling has been made more robust. Fixes include:

- stable tool IDs even when IDs contain gaps;
- safer add, copy, delete, and selection behavior;
- corrected keyboard-shortcut context;
- improved synchronization between selected Geometry tools and their displayed diameter.

### Flexible Excellon drill mapping

Drill sizes from an Excellon file can be mapped to tools that are actually available on the CNC machine.

For example, a PCB may contain 0.2 mm and 0.3 mm holes while the local machine cannot reliably drill 0.2 mm. The user can explicitly choose a suitable database tool for each drill group.

If multiple drill groups are assigned to the same physical database tool, FlatCAM Enhanced can merge them into one machining group while preserving all drill and slot locations exactly once.

The original Excellon object remains unchanged.

### Safer multi-tool CNC generation

When multiple drilling tools are selected while tool change is disabled, FlatCAM Enhanced no longer silently chooses the first tool.

A dialog lets the user explicitly choose whether to:

- use tool change for the current CNC job; or
- use one of the selected tools for all selected drill groups.

This decision applies only to the generated CNC job. It does not modify the original Excellon data or permanently change the tool-change setting.

### Geometry and board cutout workflow

Geometry/Cutout tool handling has been corrected, including errors found when adding a database tool, deleting an older tool, and switching between tools with different diameters.

### Project handling

Project saving and Recent Projects registration have been corrected so successfully saved projects are registered consistently.

### Localization

New user-facing dialogs use FlatCAM's existing gettext localization system.

English remains the source language and German translations are included for the newly added drilling and tool-selection dialogs.

## How it is tested

Changes are tested in the actual application using real PCB workflows, including:

- Gerber import;
- Excellon drilling;
- isolation routing;
- Tool Database operations;
- CNC job generation;
- Geometry/Cutout and board outline milling.

AI-assisted code analysis and implementation tools were used extensively during development. Changes are reviewed and tested in the running application rather than accepted solely from static analysis.

## Installation

The current development environment uses Python 3.8 and a virtual environment.

For Windows, an `install.bat` helper is included to create/install the tested Python environment from the supplied dependency list. The application can then be started with the included launcher.

A pre-built Windows distribution is planned for a future release so end users will not need to install Python manually.

## Project status

The project is under active development and is based on **FlatCAM Beta 8.994**.

The goal is not to rewrite FlatCAM from scratch, but to preserve its useful CAM functionality while repairing problems encountered during real use and improving selected workflows.

## Upstream credits

FlatCAM was originally created by **Juan Pablo Caram** and subsequently developed and maintained by other contributors, including **Marius Stanciu**.

This fork would not exist without their work.

## License

This repository retains the original FlatCAM copyright and licensing notices.

FlatCAM is distributed under the **MIT License**. See [LICENSE](LICENSE) for the full license text.
