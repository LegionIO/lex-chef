# lex-chef: Chef Server Integration for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that connects to Chef Server APIs. Provides runners for querying and managing Chef resources including nodes, cookbooks, environments, roles, groups, policies, data bags, licenses, and search.

**License**: MIT

## Architecture

```
Legion::Extensions::Chef
└── Runners/
    ├── Node          # Chef node operations
    ├── Cookbook       # Cookbook queries
    ├── Environment   # Environment management
    ├── Role          # Role queries
    ├── Group         # Group management
    ├── Policy        # Policy queries
    ├── Data          # Data bag operations
    ├── License       # License info
    └── Search        # Chef search API
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `faraday` | HTTP client |
| `faraday_middleware` | HTTP middleware |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
