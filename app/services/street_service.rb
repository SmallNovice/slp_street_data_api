class StreetService
  attr_reader :host

  def initialize
    @host = 'http://localhost:3000/'
  end

  def get_index
    RestClient::Request.execute(
      method: :get,
      url: get_index_url,
      timeout: 3
    )
  end

  def get_show(id)
    RestClient::Request.execute(
      method: :get,
      url: get_show_url(id),
      timeout: 3
    )
  end

  def get_update(id, payload)
    RestClient::Request.execute(
      method: :put,
      url: get_show_url(id),
      payload: payload,
      timeout: 3
    )
  end

  def get_create(payload)
    RestClient::Request.execute(
      method: :post,
      url: get_index_url,
      payload: payload,
      timeout: 3
    )
  end

  def destroy(id)
    RestClient::Request.execute(
      method: :delete,
      url: get_show_url(id),
      timeout: 3
    )
  end

  private

  def get_index_url
    "#{@host}api/v1/projects/"
  end

  def get_show_url(id)
    "#{@host}api/v1/projects/#{id}"
  end
end
