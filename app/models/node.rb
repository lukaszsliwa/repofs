class Node < ActiveRecord::Base
  attr_accessor :subdomain

  before_validation :prepare_domain

  validates :subdomain, presence: true
  validates :domain, uniqueness: true

  def prepare_domain
    self.domain = Settings.node.domain % {subdomain: subdomain}
  end
end
