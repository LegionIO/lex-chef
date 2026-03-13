# lex-chef

Chef Server integration for [LegionIO](https://github.com/LegionIO/LegionIO). Queries and manages Chef resources including nodes, cookbooks, environments, roles, groups, policies, data bags, organizations, and search via the Chef Server API.

## Installation

```bash
gem install lex-chef
```

Or add to your Gemfile:

```ruby
gem 'lex-chef'
```

## Runners

| Runner | Operations |
|--------|-----------|
| Node | list, get, add, update, delete |
| Cookbook | queries |
| Environment | management |
| Role | queries |
| Group | management |
| Policy | queries |
| Data | data bag operations |
| License | license info |
| Organization | organization management |
| User | user management |
| Search | Chef search API |

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- Chef Server

## License

MIT
