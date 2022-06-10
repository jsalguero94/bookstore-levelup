# frozen_string_literal: true

class Book < ApplicationRecord
  include Filterable
  after_initialize :set_defaults

  paginates_per 20

  belongs_to :category
  belongs_to :author
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  has_many :book_comments, dependent: :destroy
  has_many :users, through: :book_comments

  scope :active, -> { where active: true }
  scope :inactive, -> { where active: false }
  scope :filter_by_author, ->(author_id) { where author_id: author_id }
  scope :filter_by_tag, ->(tag_id) { joins(:book_tags).merge(BookTag.where(tag_id: tag_id)) }

  validates :code, :name, :price, :number_of_pages, :date_published, presence: true
  validates :name, length: { maximum: 30 }
  validates :price, numericality: { greater_than: 0 }
  validates :active, inclusion: [true, false]
  validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/ }

  validate  :date_published_is_date?

  private

  def set_defaults
    self.code ||= SecureRandom.uuid
  end

  def date_published_is_date?
    errors.add(:date_published, 'must be a valid date') unless date_published.is_a?(Date)
  end
end
