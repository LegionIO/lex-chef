# lex-chef: Chef Server Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects to Chef Server APIs via Faraday. Provides runners for querying and managing Chef resources including nodes, cookbooks, environments, roles, groups, policies, data bags, licenses, organizations, users, and search.

**GitHub**: https://github.com/LegionIO/lex-chef
**License**: MIT

## Architecture

```
Legion::Extensions::Chef
└── Runners/
    ├── Node          # Chef node CRUD (list, add, delete, get, update)
    ├── Cookbook      # Cookbook queries
    ├── Environment   # Environment management
    ├── Role          # Role queries
    ├── Group         # Group management
    ├── Policy        # Policy queries
    ├── Data          # Data bag operations
    ├── License       # License info
    ├── Organization  # Organization management
    ├── User          # User management
    └── Search        # Chef search API
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/chef.rb` | Entry point, extension registration |
| `lib/legion/extensions/chef/runners/` | All Chef resource runners |
| `lib/legion/extensions/chef/version.rb` | Version constant (0.1.0) |

## Dependencies

| Gem | Purpose |
|-----|---------|
| `faraday` (>= 2.0) | HTTP client for Chef Server API |

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## Notes

- All runner methods follow the pattern: `list`, `get`, `add`, `update`, `delete`
- Runners include `Legion::Extensions::Helpers::Lex` for framework integration
- Ruby >= 3.4 required

---

**Maintained By**: Matthew Iverson (@Esity)
