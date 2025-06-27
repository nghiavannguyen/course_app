generate image, icon, svg: dart run build_runner build

A Flutter project using Melos for monorepo management.

## Setup

1. Install Melos globally:

```bash
dart pub global activate melos
```

2. Bootstrap the project:

```bash
melos bootstrap
```

This will:

- Install all dependencies for all packages
- Link local packages together
- Run `flutter pub get` in all packages

## Available Commands

- `melos analyze` - Run Flutter analyze on all packages
- `melos format` - Format all Dart files
- `melos test` - Run tests on all packages
- `melos clean` - Clean all packages
- `melos pub-get` - Get dependencies for all packages
- `melos build-runner` - Run build_runner on all packages

## Project Structure

```
packages/
  ├── core_ui/         # UI components and widgets
  ├── core_network/    # Network and API handling
  └── ...             # Other packages
```

## Development Workflow

1. When pulling new changes:

```bash
melos bootstrap
```

2. When adding new dependencies to any package:

```bash
melos pub-get
```

3. When generating code:

```bash
melos build-runner
```

4. Before committing:

```bash
melos format
melos analyze
melos test
```

II. auto gen image, icon
dart run build_runner build
