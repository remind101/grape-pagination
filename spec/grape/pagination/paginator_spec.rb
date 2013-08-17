require 'spec_helper'

describe Grape::Pagination::Paginator do
  let(:request      ) { double(Rack::Request, url: 'https://localhost:5000/api/v1/tweets?page=1&per_page=30') }
  let(:endpoint     ) { double(Grape::Endpoint, request: request, header: nil, params: Hashie::Mash.new(page: 1, per_page: 30)) }
  let(:collection   ) { double('collection', count: 4, paginate: nil) }
  subject(:paginator) { described_class.new endpoint, collection }

  describe '.paginate' do
    it 'sets the X-Total header' do
      endpoint.should_receive(:header).with('X-Total', 4)
      paginator.paginate
    end

    it 'paginates the collection' do
      collection.should_receive(:paginate).with(page: 1, per_page: 30)
      paginator.paginate
    end
  end
end
