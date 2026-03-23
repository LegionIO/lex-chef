# Changelog

## [Unreleased]

## [0.2.1] - 2026-03-22

### Changed
- Add legion-cache, legion-crypt, legion-data, legion-json, legion-logging, legion-settings, and legion-transport as runtime dependencies
- Update spec_helper with real sub-gem helper stubs for Helpers::Lex

## [0.2.0] - 2026-03-15

### Added
- `Helpers::Client` module with Faraday connection factory (supports `url:`, `client_name:`, `api_key:`)
- `Runners::Node` - full CRUD: `list_nodes`, `get_node`, `create_node`, `update_node`, `delete_node`
- `Runners::Organization` - full CRUD: `list_organizations`, `get_organization`, `create_organization`, `update_organization`, `delete_organization`
- `Runners::Cookbook` - `list_cookbooks`, `get_cookbook`
- `Runners::Environment` - `list_environments`, `get_environment`, `create_environment`, `delete_environment`
- `Runners::Role` - `list_roles`, `get_role`, `create_role`, `delete_role`
- `Runners::Group` - `list_groups`, `get_group`
- `Runners::Policy` - `list_policies`, `get_policy`
- `Runners::Data` - `list_data_bags`, `get_data_bag`
- `Runners::License` - `get_license`
- `Runners::User` - `list_users`, `get_user`
- `Runners::Search` - `search` with `index:`, `query:`, `rows:`, `start:` parameters
- Standalone `Client` class including all runners for use outside the Legion runtime
- Entry point now requires all runner and helper modules

## [0.1.0] - 2026-03-13

### Added
- Initial release
