class GraphqlController < ApplicationController
  skip_forgery_protection

  def execute
    result = fresh_or_cached_results
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  def fresh_or_cached_results
    if cacheable?
      Rails.cache.fetch(cache_key, expires_in: Rails.application.config_for(:cache)['ttl']) do
        Portfolio18Schema.execute(*query_parameters).to_h
      end
    else
      Portfolio18Schema.execute(*query_parameters)
    end
  end

  def query_parameters
    [
      params[:query],
      {
        variables: ensure_hash(params[:variables]),
        operation_name: params[:operationName],
        context: {
          # e.g. current_user: current_user,
        }
      },
    ]
  end

  def cacheable?
    params[:context].blank? && params[:operation_name].blank?
  end

  def cache_key
    [params[:query], params[:variables].to_s].map { |s| Digest::MD5.hexdigest(s) }.join('/')
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: :internal_server_error
  end
end
