# lex-chef

Chef Server integration for [LegionIO](https://github.com/LegionIO/LegionIO). Query and manage Chef resources including nodes, organizations, cookbooks, environments, roles, and more via the Chef Server API from within task chains or as a standalone client library.

## Installation

```bash
gem install lex-chef
```

Or add to your Gemfile:

```ruby
gem 'lex-chef'
```

## Standalone Usage

```ruby
require 'legion/extensions/chef'

client = Legion::Extensions::Chef::Client.new(
  host: 'https://chef.example.com',
  token: 'your-api-token'
)

# Nodes (full CRUD)
client.list_nodes
client.get_node(node: 'web-01')
client.create_node(node: 'web-02', attributes: {})
client.update_node(node: 'web-02', attributes: { role: 'web' })
client.delete_node(node: 'web-02')

# Organizations (full CRUD)
client.list_orgs
client.get_org(org: 'my-org')
client.create_org(org: 'new-org', full_name: 'New Org')
client.update_org(org: 'new-org', full_name: 'Updated Org')
client.delete_org(org: 'new-org')

# Other runners (list and get)
client.list_cookbooks
client.get_cookbook(cookbook: 'nginx')
```

## Runners

### Node (full CRUD)

| Method | Parameters | Description |
|--------|-----------|-------------|
| `list_nodes` | (none) | List all nodes |
| `get_node` | `node:` | Get a node |
| `create_node` | `node:`, `attributes:` | Create a node |
| `update_node` | `node:`, `attributes:` | Update a node |
| `delete_node` | `node:` | Delete a node |

### Organization (full CRUD)

| Method | Parameters | Description |
|--------|-----------|-------------|
| `list_orgs` | (none) | List all organizations |
| `get_org` | `org:` | Get an organization |
| `create_org` | `org:`, `full_name:` | Create an organization |
| `update_org` | `org:`, `full_name:` | Update an organization |
| `delete_org` | `org:` | Delete an organization |

### Additional Runners (list and get only)

The following 9 runners have `list` and `get` implemented. `create`, `update`, and `delete` are pending.

| Runner | Methods |
|--------|---------|
| Cookbook | `list_cookbooks`, `get_cookbook` |
| Environment | `list_environments`, `get_environment` |
| Role | `list_roles`, `get_role` |
| Group | `list_groups`, `get_group` |
| Policy | `list_policies`, `get_policy` |
| Data | `list_data_bags`, `get_data_bag` |
| License | `list_licenses`, `get_license` |
| User | `list_users`, `get_user` |
| Search | `list_search_indexes`, `get_search_index` |

## Requirements

- Ruby >= 3.4
- Chef Server with API token (Bearer token auth)
- `faraday` >= 2.0

## License

MIT
