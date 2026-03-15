# frozen_string_literal: true

require 'spec_helper'
require 'faraday'
require 'legion/extensions/chef/client'

# rubocop:disable Metrics/BlockLength
RSpec.describe Legion::Extensions::Chef::Client do
  let(:mock_conn) { instance_double(Faraday::Connection) }

  before { allow(Faraday).to receive(:new).and_return(mock_conn) }

  describe '#initialize' do
    it 'stores connection options' do
      client = described_class.new(url: 'https://chef.local/organizations/myorg')
      expect(client.opts[:url]).to eq('https://chef.local/organizations/myorg')
    end

    it 'compacts nil values' do
      client = described_class.new
      expect(client.opts).not_to have_key(:client_name)
    end
  end

  describe 'node operations' do
    let(:client) { described_class.new }

    it 'lists nodes' do
      allow(mock_conn).to receive(:get).with('nodes').and_return(double(body: { 'node1' => 'url' }))
      result = client.list_nodes
      expect(result[:nodes]).to have_key('node1')
    end

    it 'gets a node' do
      allow(mock_conn).to receive(:get).with('nodes/web1').and_return(double(body: { 'name' => 'web1' }))
      result = client.get_node(name: 'web1')
      expect(result[:node]['name']).to eq('web1')
    end

    it 'creates a node' do
      allow(mock_conn).to receive(:post).and_return(double(body: { 'name' => 'web2' }))
      result = client.create_node(name: 'web2')
      expect(result[:created]).to be true
    end

    it 'deletes a node' do
      allow(mock_conn).to receive(:delete).and_return(double(body: {}))
      result = client.delete_node(name: 'web1')
      expect(result[:deleted]).to be true
    end

    it 'updates a node' do
      allow(mock_conn).to receive(:put).and_return(double(body: { 'name' => 'web1' }))
      result = client.update_node(name: 'web1', run_list: ['recipe[base]'])
      expect(result[:updated]).to be true
    end
  end

  describe 'organization operations' do
    let(:client) { described_class.new }

    it 'lists organizations' do
      allow(mock_conn).to receive(:get).with('/organizations').and_return(double(body: { 'org1' => 'url' }))
      result = client.list_organizations
      expect(result[:organizations]).to have_key('org1')
    end

    it 'gets an organization' do
      allow(mock_conn).to receive(:get).with('/organizations/myorg').and_return(double(body: { 'name' => 'myorg' }))
      result = client.get_organization(name: 'myorg')
      expect(result[:organization]['name']).to eq('myorg')
    end

    it 'creates an organization' do
      allow(mock_conn).to receive(:post).and_return(double(body: { 'name' => 'neworg' }))
      result = client.create_organization(name: 'neworg', full_name: 'New Org')
      expect(result[:created]).to be true
    end

    it 'deletes an organization' do
      allow(mock_conn).to receive(:delete).and_return(double(body: {}))
      result = client.delete_organization(name: 'oldorg')
      expect(result[:deleted]).to be true
    end
  end

  describe 'search' do
    let(:client) { described_class.new }

    it 'searches an index' do
      allow(mock_conn).to receive(:get).and_return(double(body: { 'total' => 5, 'rows' => [] }))
      result = client.search(index: 'node')
      expect(result[:total]).to eq(5)
    end

    it 'passes query parameters' do
      allow(mock_conn).to receive(:get)
        .with('search/node', { q: 'name:web*', rows: 100, start: 0 })
        .and_return(double(body: { 'total' => 2, 'rows' => [] }))
      result = client.search(index: 'node', query: 'name:web*', rows: 100)
      expect(result[:total]).to eq(2)
    end
  end
end
# rubocop:enable Metrics/BlockLength
