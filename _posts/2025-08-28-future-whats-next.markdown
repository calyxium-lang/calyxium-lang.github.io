---
layout: post
title: "The Future of Calyxium - What's Next"
date: 2025-08-28 11:19:45 -0400
categories: calyxium update
css: /assets/css/calyxium.css
---

Calyxium is still in active development and has not yet had its first offical release. While the core parser, interpreter, and toolchain are in place, there are several major improvemments we're working on before a stable release.

This post highlights some of the upcoming changes and features we're building.

## Bug Fixes

- [**Fix Scope Isuue (#50)**](https://github.com/calyxium-lang/calyxium/issues/50) - 
    Proper variable scoping is essential for a statically-typed language. Right now, some scope resolution bugs cause variables to shadow incorrectly. These issues are being addressed so that block scoping behaves as expected.

## [Feature: Custom Intermediate Representation (IR)](https://github.com/calyxium-lang/calyxium/issues/49)

At the moment, the backend pipeline directly cosumes the AST for type checking and bytecode generation. This creates complexity and makes backend changes harder to manage. To address this, we're introducing a **custom Intermediate Representation (IR)**.

### Goals

- Generate a simplified IR from the AST.
- Perform type checking on the IR rather than the AST.
- Update the bytecode generator to read from the typed IR.

### Proposed IR Example

```
Block[
    VarDecl(
        x : Ast.Type.SymbolType { value = "int" }
          = Ast.Expr.IntExpr { value = 10 }
    )
]
```

### Tasks

- **IR Generation** - 
    Builds a converter from AST -> IR, starting with simple constructs (variable declarations, binary ops).

- **Typed IR** - 
    Migrate the type checker to work on IR nodes, ensuring type info (int, float, bool, etc.) is preserved.

- **Backend Update** - 
    Modify the bytecode generator to consume the typed IR. Validate correctness on simple programs.

## [Feature: Core Functional Primitives](https://github.com/calyxium-lang/calyxium/issues/47)

Calyxium is designed to feel expressive and functional by default. To support this, we are implementing the following core primitives:

- **map**
- **filter**
- **fold**
- **cons (::)**

These functions will make collection handling much more natural and help define Calyxium’s identity as a language suited for modern functional programming patterns.

## Looking Ahead
These updates represent the next big steps before Calyxium’s first official release. Once the IR and functional primitives are in place, we'll be closer to a stable foundation with clearer separation between parsing, typing, and execution.