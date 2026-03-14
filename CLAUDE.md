# lex-chef: Chef Server Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects to Chef Server APIs via Faraday. Defines runners for querying and managing Chef resources including nodes, cookbooks, environments, roles, groups, policies, data bags, licenses, organizations, users, and search.

**GitHub**: https://github.com/LegionIO/lex-chef
**License**: MIT

## Status

Partial. Runner modules and method signatures are defined but method bodies are empty stubs (`def list(**); end`). Only `Node` and `Organization` have method names beyond the empty include-only pattern; none contain actual HTTP calls. No `Helpers::Client` module exists — the `faraday` dependency is declared but not yet wired up.

## Architecture

```
Legion::Extensions::Chef
└── Runners/
    ├── Node          # list, add, delete, get, update (empty bodies)
    ├── Cookbook      # stub (include only)
    ├── Environment   # stub (include only)
    ├── Role          # stub (include only)
    ├── Group         # stub (include only)
    ├── Policy        # stub (include only)
    ├── Data          # stub (include only)
    ├── License       # stub (include only)
    ├── Organization  # list, get, create, delete, update (empty bodies)
    ├── User          # stub (include only)
    └── Search        # stub (include only)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/chef.rb` | Entry point, extension registration |
| `lib/legion/extensions/chef/runners/` | All Chef resource runners (stubs) |
| `lib/legion/extensions/chef/version.rb` | Version constant (0.1.0) |

## Dependencies

| Gem | Purpose |
|-----|---------|
| `faraday` (>= 2.0) | HTTP client for Chef Server API (declared; not yet wired) |

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
