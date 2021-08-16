# frozen_string_literal: true

class BaseService
  attr_accessor :error

  def success?
    error.nil?
  end

  protected

  def error!(error)
    self.error = error
  end
end