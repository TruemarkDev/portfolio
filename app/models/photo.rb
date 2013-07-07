class Photo < ActiveRecord::Base
  # Includes
  mount_uploader :asset, ImageUploader

  # Before, after callbacks

  # Default scopes, default values (e.g. self.per_page =)
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    'public/uploads'
  end

  PER_PAGE = 50
  OWNER_TYPES = %w[Project] # Event

  # Associations: belongs_to > has_one > has_many > has_and_belongs_to_many
  belongs_to :owner, polymorphic: true

  # Validations: presence > by type > validates
  validates :owner_type, inclusion: {in: Photo::OWNER_TYPES}
  validates_presence_of :asset, :owner_id, :owner_type

  # Other properties (e.g. accepts_nested_attributes_for)
  attr_accessible :asset, :asset_cache, :owner_id, :owner_type, :desc, :image_width, :image_height

  # Model dictionaries, state machine

  # Scopes
  default_scope order: 'photos.weight DESC, photos.created_at ASC'

  class << self
  end

  # Other model methods

  # Private methods (for example: custom validators)
  private

end
