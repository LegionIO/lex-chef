# lex-chef: Chef Server Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects to Chef Server APIs via Faraday. Defines runners for querying and managing Chef resources including nodes, cookbooks, environments, roles, groups, policies, data bags, licenses, organizations, users, and search.

**Version**: 0.2.0
**GitHub**: https://github.com/LegionIO/lex-chef
**License**: MIT

## Status

Implemented (v0.2.0). `Helpers::Client` wired up with Faraday and Chef Server auth headers. `Node` and `Organization` runners fully implemented with CRUD. Remaining 9 runners have `list` and `get` stubs. Standalone `Client` class includes all 12 runners.

## Architecture

```
Legion::Extensions::Chef
├── Runners/
│   ├── Node          # list_nodes, get_node, create_node, update_node, delete_node (full CRUD)
│   ├── Organization  # list_orgs, get_org, create_org, update_org, delete_org (full CRUD)
│   ├── Cookbook      # list, get stubs
│   ├── Environment   # list, get stubs
│   ├── Role          # list, get stubs
│   ├── Group         # list, get stubs
│   ├── Policy        # list, get stubs
│   ├── Data          # list, get stubs
│   ├── License       # list, get stubs
│   ├── User          # list, get stubs
│   ├── Search        # list, get stubs
│   └── [1 additional runner] # list, get stubs
├── Helpers/
│   └── Client        # Faraday connection with Chef Server auth headers
└── Client            # Standalone client class (includes all 12 runners)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/chef.rb` | Entry point, extension registration |
| `lib/legion/extensions/chef/runners/` | All Chef resource runners |
| `lib/legion/extensions/chef/helpers/client.rb` | Faraday client with Chef Server auth headers |
| `lib/legion/extensions/chef/client.rb` | Standalone `Client` class for use outside Legion framework |
| `lib/legion/extensions/chef/version.rb` | Version constant (0.2.0) |

## Dependencies

| Gem | Purpose |
|-----|---------|
| `faraday` (>= 2.0) | HTTP client for Chef Server API |

## Development

14 specs total.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
