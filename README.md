# Content Bank

An Agent Skill for banking and retrieving reusable content—for both writing and coding.

## Overview

The **content-bank** skill helps you:

**Writing** (primary):
- Bank well-crafted paragraphs, structural frameworks, and recurring themes
- Retrieve content to enrich essays, articles, and documentation

**Coding** (secondary):
- Bank useful code patterns, legacy snippets worth preserving, and architectural ideas
- Retrieve solutions and patterns when facing similar problems

## Installation

```bash
git clone https://github.com/jackyko1991/Content-Bank-Skills
```

### Project-Local Installation

Install the skill for a specific project:

```bash
mkdir -p .claude/skills
cp -r Content-Bank-Skills/skills/content-bank .claude/skills/
```

### Global Installation

Install the skill globally so it's available across all projects:

```bash
mkdir -p ~/.claude/skills
cp -r Content-Bank-Skills/skills/content-bank ~/.claude/skills/
```

With global installation, the content-bank skill will be available in any directory where you use Claude Code.

The skill will automatically initialize on first use—simply start banking content and the `content-bank/` folder structure will be created automatically.

## How It Works

The content-bank skill uses **proactive behavior**:

- **Proactively offers to store** when Agent detects well-crafted paragraphs, useful code patterns, or content worth preserving
- **Proactively offers to retrieve** when starting new work where banked content may be relevant

You can also explicitly request:
```
Bank this idea about {topic}
Find content about {topic}
Show my content bank topics
```

### Guided Brainstorming

Use the skill to guide idea development through questions:

```
Help me brainstorm and bank ideas about {topic}
```

Agent will ask questions one-by-one to help you articulate and refine your thoughts, then bank the results.

## Content Bank Structure

```
content-bank/
├── topics.md           # Navigable topic index
└── {topic}/            # One folder per topic (kebab-case)
    ├── ideas.md        # Concepts and themes
    ├── snippets.md     # Text or code fragments
    └── outlines.md     # Frameworks or architecture patterns
```

## Capabilities

| Capability | Description |
|------------|-------------|
| **Store** | Save reusable content (ideas, snippets, outlines, code) into the bank |
| **Retrieve** | Search and get previously banked content |
| **List** | Browse topics and content within topics |

### Store

Store reusable content when you identify it:

**Writing:**
```
Bank this idea about {topic}
Bank this snippet about {topic}
Bank this outline about {topic}
```

**Code:**
```
Bank this code pattern for {topic}
Save this legacy code under {topic}
```

### Retrieve

Retrieve previously banked content:

**Writing:**
```
Find content about {topic}
What do I have banked on {keywords}?
Retrieve snippets about {topic}
```

**Code:**
```
What code do I have for {problem}?
Find TypeScript snippets about {topic}
```

### List

List and browse the content bank:

```
Show my content bank topics
List content bank topics
Show what's in {topic}
Browse {topic}
```

## Skill Structure

```
skills/content-bank/
├── SKILL.md           # Main skill entry point
├── storing.md         # Store workflow details
├── retrieving.md      # Retrieve workflow details
├── listing.md         # List/browse details
└── scripts/
    └── init.sh        # Initialization script
```
