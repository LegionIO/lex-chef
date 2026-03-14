# lex-chef

Chef Server integration for [LegionIO](https://github.com/LegionIO/LegionIO). Defines runners for querying and managing Chef resources including nodes, cookbooks, environments, roles, groups, policies, data bags, organizations, and search via the Chef Server API.

## Installation

```bash
gem install lex-chef
```

Or add to your Gemfile:

```ruby
gem 'lex-chef'
```

## Status

This extension is partial. Runner modules and method signatures are defined but have empty method bodies. No HTTP client is wired up yet. Runner implementation using the `faraday` dependency is pending.

## Runners

| Runner | Defined Methods | Status |
|--------|----------------|--------|
| Node | list, get, add, update, delete | signatures only |
| Cookbook | (none) | stub |
| Environment | (none) | stub |
| Role | (none) | stub |
| Group | (none) | stub |
| Policy | (none) | stub |
| Data | (none) | stub |
| License | (none) | stub |
| Organization | list, get, create, delete, update | signatures only |
| User | (none) | stub |
| Search | (none) | stub |

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- Chef Server

## License

MIT
