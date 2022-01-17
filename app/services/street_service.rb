class StreetService
  attr_reader :host

  def initialize
    @host = 'http://localhost:3000'
  end

  def get_project_index(departments_id, categories_id)
    RestClient::Request.execute(
      method: :get,
      url: get_index_url(departments_id, categories_id),
      timeout: 3
    )
  end

  def get_project_show(departments_id, categories_id, id)
    RestClient::Request.execute(
      method: :get,
      url: get_show_url(departments_id, categories_id, id),
      timeout: 3
    )
  end

  def get_project_update(departments_id, categories_id, id, payload)
    RestClient::Request.execute(
      method: :put,
      url: get_show_url(departments_id, categories_id, id),
      payload: payload,
      timeout: 3
    )
  end

  def get_project_create(departments_id, categories_id, payload)
    RestClient::Request.execute(
      method: :post,
      url: get_index_url(departments_id, categories_id),
      payload: payload,
      timeout: 3
    )
  end

  def destroy_project(departments_id, categories_id, id)
    RestClient::Request.execute(
      method: :delete,
      url: get_show_url(departments_id, categories_id, id),
      timeout: 3
    )
  end

  private

  def get_index_url(departments_id, categories_id)
    "#{@host}/api/v1/departments/#{departments_id}/categories/#{categories_id}/projects"
  end

  def get_show_url(departments_id, categories_id, id)
    "#{@host}/api/v1/departments/#{departments_id}/categories/#{categories_id}/projects/#{id}"
  end
end
