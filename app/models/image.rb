class Image < ActiveRecord::Base
  # Includes
  mount_uploader :asset, ImageUploader

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :category

  # Validations: presence > by type > validates
  validates_presence_of :asset, :category

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :asset, :asset_cache, :asset_cache_changed, :category_id, :title, :desc, :is_vertical

  def asset_cache_changed
    false
  end

  # For image change when only screencap uploads asset_cache
  def asset_cache_changed=(value)
    self.save! if self.persisted?
    true
  end

  # Model dictionaries, state machine

  # Scopes
  default_scope :order => 'created_at DESC'

  class << self
  end

  # Other model methods
  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def asset_url_resolved(type)
    self.asset.url((type.to_s+(self.is_vertical? ? '_vertical' : '')).to_sym)
  end

  # Private methods (for example: custom validators)
  private

end
