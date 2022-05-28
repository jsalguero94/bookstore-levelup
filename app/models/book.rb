class Book < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :category
  belongs_to :author
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  scope :only_active, -> { where("active = true") }

  validates :code, :name, :price, :number_of_pages, :date_published, :category_id, :author_id, presence: true
  validates :name, length: { maximum: 30 }
  validates :price, numericality: {greater_than:0}
  validates :active, inclusion: [true, false]
  validates :name, format:{with: /[a-zA-Z0-9]+/, message: "only letters and numbers"}
  validates :code, :format => {:with => /[A-Za-z\d]([-\w]{,498}[A-Za-z\d])?/i, :message => "No valid uuid"}

  validate  :date_published_is_date?
  private

  def set_defaults
    self.code ||= SecureRandom.uuid
  end
  def date_published_is_date?
    if !date_published.is_a?(Date)
      errors.add(:date_published, 'must be a valid date')
    end
  end
end
