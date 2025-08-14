---
layout: post
title: "Welcome to Calyxium!"
date: 2025-08-13 07:48:33 -0400
categories: calyxium introduction
css: /assets/css/calyxium.css
---

Welcome to the official blog of **Calyxium**, a modern statically-typed programming language designed for performance, readability, and expressiveness.  

This blog will share updates about the language, the virtual machine, standard library additions, tutorials, and community news.  

## Getting Started with Calyxium

Here's a simple Calyxium example to get you started:

```calyxium
let factorial(n) {
  if n <= 1 then n else n * factorial(n - 1)
}

print(factorial(5))
```

Calyxium supports higher-order functions and clean functional-style syntax:
```calyxium
let sqr = fn x -> x * x
print(5 |> sqr)
```

## Resources

- Documentation: [Documentation](https://calyxium-lang.github.io/docs/)
- Source Code: [Source Code](https://github.com/calyxium-lang/calyxium)

Stay tuned for more posts about advanced features, tutorials, and VM internals. We welcome contributions from the community, whether it's libraries, tutorials, or ideas to improve the language.